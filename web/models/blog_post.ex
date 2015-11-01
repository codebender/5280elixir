defmodule Elixir5280.BlogPost do
  @blog_file_path "blog/"

  def all do
    blog_post_files |> list_files
  end

  def get!(id) do
    case File.exists?(filepath(id)) do
      true ->
        Map.merge(%{id: id, html: Earmark.to_html(markdown_data(filename(id)))},
          meta_data(filename(id)))
      false ->
        raise JSONAPI.ResourceNotFound
    end
  end

  defp blog_post_files do
    File.ls!(@blog_file_path)
  end

  defp list_files(filenames) do
    Enum.map(filenames, fn(x) -> Map.merge(%{id: id(x)}, meta_data(x)) end) |>
      Enum.reverse
  end

  defp id(filename) do
    String.replace(filename, ~r/.md/, "")
  end

  defp meta_data(filename) do
    Regex.run(~r/^---\s(.*)\s---/s, read(filename), capture: :all_but_first) |>
      YamlElixir.read_from_string(atoms: true)
  end

  defp read(filename) do
    File.read!(@blog_file_path <> filename)
  end

  defp markdown_data(filename) do
    read(filename) |>  String.replace(~r/^---.*---\s*/s, "")
  end

  defp filepath(id) do
    @blog_file_path <> filename(id)
  end

  defp filename(id) do
    id <> ".md"
  end
end
