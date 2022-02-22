#' @title Web Map Tiles
#' @description Convert Web Map Tile coordinates to Mercator
#' @name wmt_to_merc
#' @param x A numeric value or vector
#' @rdname wmt_to_merc
#' @return A numeric value or vector
#' @examples
#' wmt_to_merc(sample(0:15), sample(0:15), 4)
#' @export

wmt_to_merc = function(x, y, z)
{
  m_ext = pi * 6378137 # Mercator extent
  res = 2 ^ (1:14)[z]  # grid size
  x_grid = scales::rescale(x, from = c(0, res), to = c(-m_ext, m_ext))
  y_grid = scales::rescale(y, from = c(0, res), to = c(m_ext, -m_ext))
  dplyr::tibble(x = x_grid, y = y_grid, z = z)
}


#' @title Web Map Tiles
#' @description Convert Mercator to Web Map Tile coordinates
#' @name merc_to_wmt
#' @param x A numeric value or vector
#' @rdname merc_to_wmt
#' @return A numeric value or vector
#' @examples
#' m_ext = pi * 6378137 # Mercator extent
#' dat = dplyr::tibble(x = pi * 6378137 * runif(50, min=-1), y = pi * 6378137 * runif(50, min=-1))
#' merc_to_wmt(dat$x, dat$y, 4)
#' @export

merc_to_wmt = function(x, y, z){
  m_ext = pi * 6378137 # Mercator extent
  res = 2 ^ (1:14)[z]  # grid size
  x_grid = scales::rescale(x, from = c(-m_ext, m_ext), to = c(0, res)) |> floor()
  y_grid = scales::rescale(y, from = c(m_ext, -m_ext), to = c(0, res)) |> floor()
  dplyr::tibble(x = x_grid |> pmax(0) |> pmin(res-1),
                y = y_grid |> pmax(0) |> pmin(res-1),
                z = z)
}
