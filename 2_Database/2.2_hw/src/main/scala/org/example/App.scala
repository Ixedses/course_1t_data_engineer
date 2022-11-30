package org.example
import scala.collection.{breakOut, immutable}
import scala.io.StdIn.readLine

/* 2. Создайте ваш первый проект, который печатает на экран фразу «Hello, Scala!».
 Запустите ваш код, убедитесь, что он работает и попробуйте собрать ваш первый jar’ник.*/
object App {
  def main(args : Array[String]) {
    println( "Hello, Scala!" )
    /*3.a выводит фразу «Hello, Scala!» справа налево*/
    val startVarString = "Hello, Scala!"
    println(startVarString.reverse)

    /*переводит всю фразу в нижний регистр*/
    println(startVarString.toLowerCase())

    /*удаляет символ!*/
    println(startVarString.dropRight(1))

    /*добавляет в конец фразы «and goodbye python!»*/
    val endVarString = "and goodbye python!"
    println(startVarString.replace('!', ' ').concat(endVarString))

    /*b.Напишите программу, которая вычисляет ежемесячный оклад сотрудника после вычета налогов.
    На вход вашей программе подается значение годового дохода до вычета налогов,
    размер премии – в процентах от годового дохода и компенсация питания.*/
    println("Введите годовой доход:")
    val yearSalary = readLine().toInt
    println("Размер премии в процентах:")
    val bonus = readLine().toInt
    println("Компенсация питания:")
    val eatBonus = readLine().toInt
    val salary = (yearSalary + eatBonus + yearSalary * (bonus.toDouble / 100.toDouble)) * 0.87
    println(f"Eжемесячный оклад сотрудника после вычета налогов  равен $salary")

    /*с.Напишите программу, которая рассчитывает для каждого сотрудника отклонение(в процентах)
    от среднего значения оклада на уровень всего отдела. В итоговом значении должно учитываться
    в большую или меньшую сторону отклоняется размер оклада. На вход вышей программе подаются все значения,
    аналогичные предыдущей программе, а также список со значениями окладов сотрудников
    отдела 100, 150, 200, 80, 120, 75.*/
    val salaryList = List(100, 150, 200, 80, 120, 75)
    val awgSalary = salaryList.sum / salaryList.size
    val deviationSalary  = Math.round(100 - ((yearSalary.toDouble / awgSalary.toDouble) * 100.toDouble))
    if (yearSalary < awgSalary) {
      println(f"Оклад отклоняется в меньшую сторону на $deviationSalary  процентов")
    } else if (yearSalary == awgSalary) {
        println("Оклад совпадает со средним")
    } else {
      println("Оклад отклоняется в большую сторону " + -deviationSalary  +" процентов")
    }

    /*d.Попробуйте рассчитать новую зарплату сотрудника, добавив(или отняв, если сотрудник плохо себя вел)
    необходимую сумму с учетом результатов прошлого задания. Добавьте его зарплату в список и вычислите значение
    самой высокой зарплаты и самой низкой.*/
    println("Введите сумму урезания зарплаты сотруднику")
    val lossSalary = readLine().toInt
    val newsalaryList  =  salaryList ::: yearSalary - lossSalary :: Nil
    println("Максимальная зарплата " + newsalaryList.max)
    println("Минимальная зарплата " + newsalaryList.min)

    /*e.Также в вашу команду пришли два специалиста с окладами 350 и 90 тысяч рублей.
    Попробуйте отсортировать список сотрудников по уровню оклада от меньшего к большему.*/
    val newEmployeeSalary = List(90, 350)
    val newsalaryListsorted = List.concat(newsalaryList, newEmployeeSalary).sorted
    println(newsalaryListsorted)

    /*f.Кажется, вы взяли в вашу команду еще одного сотрудника и предложили ему оклад 130 тысяч.
    Вычислите самостоятельно номер сотрудника в списке так, чтобы сортировка
    не нарушилась и добавьте его на это место.*/
    println(newsalaryListsorted.patch(newsalaryListsorted.indexOf(150), List(130), 0))

    /*g.Попробуйте вывести номера сотрудников из полученного списка, которые попадают под категорию middle.
    На входе программе подается «вилка» зарплаты специалистов уровня middle.*/
    for (n <- newsalaryListsorted) {
      if ((n >= 100) && (n <= 150))
        println("Cпециалист c номером " + newsalaryListsorted.indexOf(n) + " уровня middle")
    }

    /*h.Однако наступил кризис и ваши сотрудники требуют повысить зарплату. Вам необходимо проиндексировать
     зарплату каждого сотрудника на уровень инфляции – 7%*/
    for(n <- newsalaryListsorted){
      println(n + (n * 0.07))
    }
  }
}