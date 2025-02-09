defmodule Mix.Tasks.Certs.Gen do
  use Mix.Task

  @shortdoc "Generates a self-signed certificate and places it in priv/certs directory"

  def run(_) do
    Mix.shell().info("Generating self-signed certificates...")

    # Execute `mix phx.gen.cert` to create certificates in `priv/cert`
    Mix.Task.run("phx.gen.cert")

    # Ensure `priv/certs` directory exists
    File.mkdir_p!("priv/certs")

    # Move the generated files from `priv/cert` to `priv/certs`
    move_cert_files()

    # Remove `priv/cert` directory
    remove_cert_directory()

    Mix.shell().info("Certificates successfully moved to priv/certs and priv/cert directory removed.")
  end

  defp move_cert_files do
    Mix.shell().info("Checking if certificate files exist in priv/cert...")

    if File.exists?("priv/cert/selfsigned.pem") and File.exists?("priv/cert/selfsigned_key.pem") do
      File.rename!("priv/cert/selfsigned.pem", "priv/certs/cert.pem")
      File.rename!("priv/cert/selfsigned_key.pem", "priv/certs/key.pem")
      Mix.shell().info("Files moved to priv/certs successfully.")
    else
      Mix.shell().error("Failed to find certificate files in priv/cert.")
    end
  end

  defp remove_cert_directory do
    if File.exists?("priv/cert") do
      File.rm_rf!("priv/cert")
      Mix.shell().info("priv/cert directory removed.")
    else
      Mix.shell().info("priv/cert directory not found. No need to remove.")
    end
  end
end
