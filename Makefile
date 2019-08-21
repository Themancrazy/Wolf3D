CC			= gcc
RM			= rm -f
NAME		= wolf3d
CFLAGS		= -Wall -Wextra -Werror
LIBFT 		= libft/libft.a
MINILIBX	= minilibx/libmlx.a
INCLUDES	= -I includes \
			  -I libft/includes \
			  -I minilibx/

LIB			= -L libft/ -lft \
			  -L minilibx/ -lmlx -framework OpenGL -framework AppKit

COMMON		= main.c

FUNCTIONS	= $(addprefix srcs/, $(COMMON))
OBJECTS		= $(FUNCTIONS:.c=.o)

.PHONY: all $(NAME) clean fclean re

all: $(NAME)

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(LIBFT):
	@make -C libft

$(MINILIBX):
	@make -C minilibx

$(NAME): $(LIBFT) $(MINILIBX) $(OBJECTS)
	@$(CC) $(CFLAGS) $(INCLUDES) -o $(NAME) $(OBJECTS) $(LIB)

clean:
	@make clean -C libft
	@make clean -C minilibx
	@$(RM) $(OBJECTS)

fclean: clean
	@make fclean -C libft
	@make fclean -C minilibx
	@$(RM) $(NAME)

re: fclean all

# EOF #