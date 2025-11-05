#Week 5 Material Code Practices
 #Exponential smoothing
  #Simple Exponential Smoothing
   #Optimizing smoothing parameters

algeria_economy
algeria_economy <- global_economy %>%
  filter(Country == "Algeria")

algeria_economy %>%
  autoplot(Population)

View(algeria_economy %>%
       autoplot(Population))

algeria_economy %>%
  autoplot(Exports) +
  labs(y = "% of GDP", title = "Exports: Algeria")
