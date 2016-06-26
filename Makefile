TARGET   = twigsh

CC       = gcc
CFLAGS   = -O0 -ggdb -Wall -std=c99 -DSINGLE_APPLET_MAIN -DSKIP_applet_main -I ./include -include ./include/autoconf.h 
LFLAGS   = -O0 -ggdb -Wall -lm 

SOURCES	 = ash.c init.c signals.c read.c xfuncs.c xfuncs_printf.c xfunc_die.c math.c u_signal_names.c copyfd.c default_error_retval.c \
	shell_common.c ash_ptr_hack.c full_write.c vfork_daemon_rexec.c device_open.c nuke_str.c parse_mode.c endofname.c time.c bb_strtonum.c \
	safe_strncpy.c wfopen.c parse_config.c compare_string_array.c skip_whitespace.c concat_path_file.c random.c xatonum.c safe_write.c getopt32.c \
	verror_msg.c messages.c perror_msg.c read_printf.c lineedit.c executable.c kill.c sysconf.c bb_pwd.c pwd_grp.c process_escape_sequence.c \
	lineedit_ptr_hack.c llist.c safe_gethostname.c last_char_is.c xgetcwd.c wfopen_input.c xrealloc_vector.c read_key.c bb_qsort.c safe_poll.c \
	get_line_from_file.c procps.c get_last_path_component.c xreadlink.c find_pid_by_name.c

OBJECTS  := $(SOURCES:.c=.o)
RM       = rm -f

$(TARGET): $(OBJECTS)
	@$(CC) $(LFLAGS) $(OBJECTS) -o $@

$(OBJECTS): %.o : %.c
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONEY: clean
clean:
	@$(RM) $(OBJECTS)

.PHONEY: remove
remove: clean
	@$(RM) $(TARGET)
