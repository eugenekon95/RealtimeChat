module SearchFormHelper
  def search_label_class
    "mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"
  end

  def svg_wrapper_class
    "absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none"
  end

  def search_form_class
    "block w-full p-3 ps-10 text-sm text-gray-900 border border-gray-300 rounded-full bg-gray-50 focus:ring-blue-500
     focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white
     dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end
end
