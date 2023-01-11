FROM docker.io/zmkfirmware/zmk-build-arm:stable

WORKDIR /app

COPY config/west.yml config/west.yml

# West Init
RUN west init -l config
# Configure West to generate compile_commands.json
RUN west config build.cmake-args -- -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
# West Update
RUN west update
# West Zephyr export
RUN west zephyr-export

COPY bin/build.sh ./

CMD ["./build.sh"]
