import static org.junit.jupiter.api.Assertions.assertEquals;

import org.wpilib.hardware.hal.HAL;
import frc.robot.subsystems.ExampleSubsystem;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ExampleUnitTest {
  private ExampleSubsystem m_exampleSubsys;

  @BeforeEach // this method will run before each test
  void setup() {
    assert HAL.initialize(); // initialize the HAL, crash if failed
    m_exampleSubsys = new ExampleSubsystem();
  }

  @AfterEach // this method will run after each test
  void shutdown() throws Exception {}

  @Test // marks this method as a test
  void testConditional() {
    assertEquals(false, m_exampleSubsys.exampleCondition());
  }
}
