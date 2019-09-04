namespace MyLibrary;

/**
 * Filter
 */
class Filter
{
    /**
     * Filters a string, returning its alpha charactersa
     *
     * @param string str
     */
    public function alpha(string str)
    {
        char ch; string filtered = "";

        for ch in str {
           if (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') {
              let filtered .= ch;
           }
        }

        return filtered;
    }
}