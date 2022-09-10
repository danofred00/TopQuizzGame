



class Rank {

  String rank = '';
  dynamic valid;
  dynamic total;

  Rank(this.valid, this.total);

  String get() {

    var d = (total/2);
    var q = (total/4);

    if(valid < d)
      return 'mediocre';
    else 
      if (valid < d+q)
        return 'bronze';
      else if(valid < total - 2)
        return 'argent';
      else
        return 'or';

  }

}
