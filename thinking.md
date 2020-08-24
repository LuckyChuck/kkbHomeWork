# Thinking1	既然内容相似度计算简单，能频繁更新，为什么还需要协同过滤算法呢？
 
答：（1）内容推送比较静态推荐，内容推荐死板，除非用户受到某一类内容影响较深，否则推送准确率可能不如协同过滤，并且不容易发现物品之间的隐藏关联属性，比如尿布和啤酒。 而协同过滤为动态推荐，容易发现这些隐藏关联，推荐准确率比较高，而且实时动态。   从ee这个角度出发，协同过滤也具有推荐新信息的能力，具有一定的“探索”能力，比较灵活，不死板。

# Thinking2	你需要推荐系统么？哪些情况下不需要推荐系统？ #

答：视情况而定，推荐系统无外乎需要从需求出发，当推荐系统能够带来比较大的提升的情况下，推荐系统是个比较好的选择。而当用户基数小，推荐系统带来的用户提升比例虽说相同，但是实际提升数量较小，这种情况下其实不建议用推荐系统。

# Thinking3	如果给一个视频打标签，视频中有音乐作为背景音乐，采用了NLP方式对内容自动打标签，可能存在什么问题？ #

答：可能会因为识别到了背景音乐中的歌词内容，识别内容误差，导致推荐结果错误。 
