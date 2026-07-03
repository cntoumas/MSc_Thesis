<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" name="serial_fft_hls" top="fft_serial">
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
    <files>
        <file name="../../serial_fft/fft_serial_tb.cpp" sc="0" tb="1" cflags="-I../../. -I../../serial_fft -Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="serial_fft/fft_serial.cpp" sc="0" tb="false" cflags="-I. -I./serial_fft" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

