# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrusu <mrusu@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/07 19:00:18 by mrusu             #+#    #+#              #
#    Updated: 2023/12/12 13:52:17 by mrusu            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#COMPILER
GCC = cc
#FLAGS FOR COMPILATION
FLAGS = -Wall -Wextra -Werror
#LIBRARY NAME
NAME = libft.a
#LIST OF SOURCE FILES
SRCS = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c \
    ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
    ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c \
    ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c \
	ft_functions.c ft_printf.c get_next_line.c
#BONUS
BONUS = ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c \
	ft_lstmap.c ft_lstnew.c ft_lstsize.c \
	ft_lstdelone.c ft_lstiter.c ft_lstlast.c
BONUS_OBJS = $(BONUS:.c=.o)
#OBJECT FILES
OBJS = $(SRCS:.c=.o)
#ALL RULE
#RULES TO MAKE A LIBRARY
all: $(NAME)
%.o: %.c
	$(GCC) $(FLAGS) -c $< -o $@
$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
bonus:	$(OBJS) $(BONUS_OBJS)
	ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
#RULES FOR CREATING OBJECT FILES
clean:
	rm -f $(OBJS)
	rm -f $(BONUS_OBJS)
#RULES TO CLEAN EVERYTHING
fclean: clean
	rm -f $(NAME)
#RULES FOR RECOMPILATION
re: fclean all
.PHONY: all clean fclean re