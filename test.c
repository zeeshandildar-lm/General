static void test_one_shot_software_polling(void) {
  uint32_t clock_cycles; // , enable , rvalue
  clock_cycles=25;
  
  printf("------ Running Test_one_shot_software_polling ----------\n\n\n"); 
  //one shot mode test
  // Disabling the timer
  timer0_en_write(0); //disabling timer
  assert (timer0_en_read() == 0);
 
  timer0_load_write(clock_cycles);
  timer0_reload_write(0);
  
  timer0_update_value_write(1);   	
  // Enabling the timer
  timer0_en_write(1); //Enabling timer
  
  while(timer0_value_read() > 0){
	  timer0_update_value_write(1);
  }
  assert(timer0_value_read()==0);

  printf("Test_one_shot_software_polling: Passed\n\n");
}
