# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skarry <skarry@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/21 15:50:55 by skarry            #+#    #+#              #
#    Updated: 2020/05/21 21:08:23 by skarry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
HEADER = libft.h
FLAGS = -Wall -Wextra -Werror

SRC = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
	ft_isdigit.c ft_isprint.c ft_memccpy.c ft_memchr.c ft_memcmp.c \
	ft_memcpy.c ft_memmove.c ft_memset.c ft_strchr.c ft_strdup.c ft_strlcat.c \
	ft_strlcpy.c ft_strlen.c ft_strncmp.c ft_strnstr.c ft_strrchr.c \
	ft_tolower.c ft_toupper.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_itoa.c \
	ft_strmapi.c ft_split.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c \
	ft_putnbr_fd.c

BNS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
	ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

SRC_OBJ = $(patsubst %.c,%.o,$(SRC))
BNS_OBJ = $(patsubst %.c,%.o,$(BNS))



all: $(NAME)
$(NAME): $(SRC_OBJ)
	ar rc $(NAME) $(SRC_OBJ)
	ranlib $(NAME)
%.o: %.c $(HEADER)
	gcc $(FLAGS) -c $< -o $@
	
clean:
	/bin/rm -rf $(SRC_OBJ) $(BNS_OBJ)

fclean: clean
	/bin/rm -rf $(NAME)

re: fclean all

bonus: $(BNS_OBJ)
ifeq ($(shell test -f $(NAME) && ar t $(NAME) | grep lst),)
	ar rc $(NAME) $(BNS_OBJ)
	ranlib $(NAME)
endif

.PHONY: all clean fclean re bonus
