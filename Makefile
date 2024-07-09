# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hitran <hitran@student.hive.fi>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/03 18:50:13 by hitran            #+#    #+#              #
#    Updated: 2024/07/09 16:14:28 by hitran           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Compiler and flags
CC 				= cc
CFLAGS 			= -Wall -Wextra -Werror
INCLUDES 		= -I./includes -I./mylib/includes

# Directories
MAN_DIR 		= ./srcs
MYLIB_DIR	 	= ./mylib

# Source's directories
MAIN_DIR 		= main
ALGO_DIR 		= algo
STACK_DIR 		= parse
UTILS_DIR 		= utils
OPS_DIR		 	= ops

# Source files by directory
MAIN_FILES 		= 	push_swap.c
ALGO_FILES 		= 	push_a2b.c 			push_b2a.c 			\
					sort_three.c 		sort_five.c
STACK_FILES 	= 	parse_input.c 		put_in_stack.c
UTILS_FILES 	= 	utils.c				stack_utils.c		chunk_utils.c
OPS_FILES		= 	swap.c 				push.c 				\
					rotate.c 			reverse_rotate.c 	\

PUSH_SWAP_SRCS	= 	$(addprefix $(MAN_DIR)/$(MAIN_DIR)/, $(MAIN_FILES)) \
					$(addprefix $(MAN_DIR)/$(ALGO_DIR)/, $(ALGO_FILES)) \
					$(addprefix $(MAN_DIR)/$(STACK_DIR)/, $(STACK_FILES)) \
					$(addprefix $(MAN_DIR)/$(UTILS_DIR)/, $(UTILS_FILES)) \
					$(addprefix $(MAN_DIR)/$(OPS_DIR)/, $(OPS_FILES))

# Library
MYLIB 			= $(MYLIB_DIR)/mylib.a

# Executables
NAME 			= push_swap
BONUS 			= checker

# Targets
all: $(NAME)

$(NAME): $(MYLIB) $(PUSH_SWAP_SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) $(PUSH_SWAP_SRCS) $(MYLIB) -o $(NAME)

$(MYLIB):
	$(MAKE) -C $(MYLIB_DIR)

clean:
	$(MAKE) clean -C $(MYLIB_DIR)


fclean: clean
	$(MAKE) fclean -C $(MYLIB_DIR)
	$(RM) $(NAME)
	
re: fclean all

.PHONY: all clean fclean re