package test;
import io.github.discovermovies.datacollector.movie.Main;
import io.github.discovermovies.datacollector.movie.network.TheMovieDbApi;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;

/*
 *   Copyright (C) 2017 Sidhin S Thomas
 *
 *   This file is part of movie-data-Collector.
 *
 *    movie-data-Collector is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   movie-data-Collector is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with movie-data-Collector.  If not, see <http://www.gnu.org/licenses/>.
 */
public class TestAPI {
    TheMovieDbApi api;

    @Test
    public void testLatestMovie(){
        {
            Main.main(null);
            TheMovieDbApi api = new TheMovieDbApi();
            try {
                String o = api.getLatestMovie();
                Assert.assertEquals(o.contains("id"), true);
            } catch (IOException e) {
                Assert.assertEquals("Exception", e.getMessage().contains("internet"), true);
            }
        }
    }

}
