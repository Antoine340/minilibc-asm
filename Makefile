##
## Makefile for ASM in /home/chauvin/Rendu-2017-Epitech/ASM/asm_minilibc
## 
## Made by chauvin
## Login   <chauvi_d>
## 
## Started on  Wed Mar  8 13:07:34 2017 chauvin
## Last update Sun Mar 26 22:07:40 2017 chauvin
## Last update Thu Mar  9 18:25:32 2017 chauvin
##

LD		=       ld

ASM		=       nasm

RM	 	=       rm -f

ASMFLAGS        =       -f elf64

SRCS            =	strlen.asm \
			strstr.asm \
			strchr.asm \
			memset.asm \
			memcpy.asm \
			memmove.asm \
			strpbrk.asm \
			rindex.asm \
			strcspn.asm \
			strcmp.asm \
			strncmp.asm \
			read.asm \
			write.asm \

OBJS            =       $(SRCS:.asm=.o)

NAME            =       libasm.so

all:                    $(NAME)

$(NAME):                $(OBJS)
						$(LD) -o $(NAME) -shared $(OBJS)

clean:
						$(RM) $(OBJS)

fclean:					clean
						$(RM) $(NAME)

re:						fclean all

%.o : %.asm
						$(ASM) $(ASMFLAGS) -o $@ $<
