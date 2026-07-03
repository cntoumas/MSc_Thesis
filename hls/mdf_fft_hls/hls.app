<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" name="mdf_fft_hls" top="fft_mdf">
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
    <files>
        <file name="../../mdf_fft/fft_mdf_tb.cpp" sc="0" tb="1" cflags="-I../../. -I../../mdf_fft -Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="mdf_fft/fft_mdf.cpp" sc="0" tb="false" cflags="-I. -I./mdf_fft" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

