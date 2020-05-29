defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug(Ueberauth)

  alias Discuss.AppUsers
  alias Discuss.AppUsers.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    # IO.inspect(conn.assigns)
    # IO.inspect(params)
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)
    insert_or_update_user(changeset)
  end

  #  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
  #   case UserFromAuth.find_or_create(auth) do
  #     {:ok, user} ->
  #       conn
  #       |> put_flash(:info, "Successfully authenticated.")
  #       |> put_session(:current_user, user)
  #       |> configure_session(renew: true)
  #       |> redirect(to: "/")

  #     {:error, reason} ->
  #       conn
  #       |> put_flash(:error, reason)
  #       |> redirect(to: "/")
  #   end
  # end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case AppUsers.get_by(User, email: changeset.changes.email) do
      nil ->
        AppUsers.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end