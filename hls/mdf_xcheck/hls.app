<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" top="fft_mdf" name="mdf_xcheck">
    <files>
        <file name="../../mdf_fft/fft_mdf_xcheck.cpp" sc="0" tb="1" cflags="-I../../. -I../../mdf_fft -Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="mdf_fft/fft_mdf.cpp" sc="0" tb="false" cflags="-I. -I./mdf_fft" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

