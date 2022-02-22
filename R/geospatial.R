#' @title Reproject points
#' @description Convert Lat-Lons (WGS84) to Mercator
#' @name latlon_to_merc
#' @param lon A numeric value or vector of longitude (East-West) values
#' @param lat A numeric value or vector of latitude (North-South) values
#' @rdname latlon_to_merc
#' @return A data.frame of Mercator coordinates
#' @examples
#' latlon_to_merc(lon = 1, lat = 52)
#' @export

latlon_to_merc = function(lon, lat)
{
  sf::sf_project(from = "+proj=longlat +datum=WGS84 +no_defs",
                 to = "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs",
                 pts = cbind(lon, lat)) |> as.data.frame() |> `names<-`(c('x','y'))
}


#' @title Reproject points
#' @description Convert Mercator to Lat-Lons (WGS84)
#' @name merc_to_latlon
#' @param lon A numeric value or vector of Mercator East-West values
#' @param lat A numeric value or vector of Mercator North-South values
#' @rdname merc_to_latlon
#' @return A data.frame of WGS84 coordinates
#' @examples
#' merc_to_latlon(lon = 1, lat = 52)
#' @export

merc_to_latlon = function(x, y)
{
  sf::sf_project(from = "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs",
                 to = "+proj=longlat +datum=WGS84 +no_defs",
                 pts = cbind(x, y)) |> as.data.frame() |> `names<-`(c('lon','lat'))
}


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
