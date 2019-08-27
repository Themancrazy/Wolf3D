#include "wolf.h"

int				main(int argc, char *argv[])
{
	t_game		game;

	if (argc != 2)
	{
		ft_putendl("usage: ./wolf3d <map>");
		return (EXIT_FAILURE);
	}
	ft_memset(&game, 0, sizeof(t_game));
	if (EXIT_FAILURE == parser(argv[1], &game))
		return (EXIT_FAILURE);
	game_init(game);
	// REMOVE JUST TO UNDERSTAND
	free_map(game.map, (size_t)game.x_max);
	// END
	return (EXIT_SUCCESS);
}

/* EOF */
