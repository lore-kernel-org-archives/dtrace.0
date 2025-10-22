Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1C262FEC
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103409; cv=fail; b=sjRSAxQM+tmASUYZvDIKEswp+Cvi0wVwmsL2vNucvBDTUujmlpvsbSkrRmxOMjPDLe1Mg6P5x2hdwylNTHzJiHe8jbkFItbz5vKKEkyF9O9OrNzoUhh6LyNVIBfKc2/394S+hnb03QKkoR9wcRkMSODVrYmNoHmm0cgC3j/wiJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103409; c=relaxed/simple;
	bh=fqQwCOv61edJ1WMdkhT1lVtFtHOaVvve2gx6wlgTtD4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q9LXHPMqQZBG4C+4+IWu22YPXR3isYbmwehYFWqjG/pK0DwBID9fISlB6aDEjsg6Mov2az0X6GWWFkZ5T0DhE0vYMGVSmD3NLQL2g8PZ5f9gzZNX+YVdY7bKiBiWTWSwhvRpx3xP/noGmPNN34wMSFmotrOyaHHcb9GgaRRWKCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AbEQm9+7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NgiIW7rS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AbEQm9+7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NgiIW7rS"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NQ70022548
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=j9YLpgjjEWZk2BMEc/
	wy/FcOCcl13JIbqEFhJH2i8b0=; b=AbEQm9+76sRuceIJKK+nwabP0rbPuZru1O
	LTwdn+WMFoMWaY7BR/jZvngAFxz6kXWiVVVjT86Tzi/xQwU/gBc0t2/Emx6NxEKA
	oUJh1oKV0QopmdcHhBj8BL5ULTMNQco1a+u8Tgrq/XEZJCjuTz7xjqctNyKeZ1iL
	4GgS9kGWm0aeWlmQ+ntoBSSZGnobl1jF0Smwbkc/XPxrqYAwDbhZ0d4L0lPGsWBr
	RS8z+V3Dgt92uFMl6uJHww40KPsB9X1mFU6ZSwIwP3oj2CDbKLX9ympC8kJw4hyc
	kUaa9iMMwYm2dFzdFanZx3A1sPb6A1fpMF9sBxcAeoG5JZw23vGg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2vvxtn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M22P7p025454
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:25 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj4k-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrQ8EodL4T1ClkwB0Rn6+eacid/slIqytM+hKNaZBs7meq2YpFWwxSvyaMr05HP6KuCRkNOK05xc/0T2y05gu5QqVplkeb+KteWxSmEXHCog0E+oJ7x98EIE/pqZ/aOf+JQGkMFs57G0MbSK6C+65iNcPrCua4T4+C225x31Z5KNPH/5J8qQd+yBiXjCCZxWWwikIAmYlWNeS7dFYo2V3u/tnl4EftxsrGvrqg77+yV3l/5JSi/Nr86GaLGQvWZb1UVuisQDsY9Lr3SKiZArUAW/MhEgEUa5DwY0bNPfkABSwDZRtxDJOgzqWYYJqhYstbz2np6h+59axUBi85+nHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9YLpgjjEWZk2BMEc/wy/FcOCcl13JIbqEFhJH2i8b0=;
 b=UaIlAhS48QHbyeZlBDAVvZdTh4u/+qkksJlei52Zc1gz2dHec6M4FAQ54LbW5Zs7ZGqE1EyrPBXQ3LWD7c0elFaM45sk04tCZ9xMmwWKRGjcqCqhpXe8Llh6c8A3LGKHxuWXm9eKrDj3DSrNxW3TQEVGLP6RHM3RLNVWTDrJRdMYX0NFuOv8kGWZA1tbX2f8ePFNCbCIiUqeE0u9FQO43j8/ONRDetOPjRT3eIzArZYX4Mo6z/RQrEbqtdJJMopUf/GGQVBQjaq55tq3wZUi3Ay5u8OS1crwfjMcdZCZ8ULTN5+VbUJqiXU9hV0A/4IyGkecZAQWU6bf907Vzhr/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9YLpgjjEWZk2BMEc/wy/FcOCcl13JIbqEFhJH2i8b0=;
 b=NgiIW7rSrcXYxXe5Orl2cdKrQW8GB/FRLbsloTJ0nUHnDeWQFC/q8qzXDk0MUXvjw8pZmkY5aOvDdmrw0aYpEVBe9pk65/tbiJFiREZ0jMcvDWOOKfyS9CJ3UVtioF6Mflt4lfDzSi2ru+vq+mRs0drqzzsJaaxyBe0Btty7CmQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 13/20] doc: Clean up the table for string relational operators
Date: Tue, 21 Oct 2025 23:22:43 -0400
Message-Id: <20251022032251.2010-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: eafb3158-689f-48ee-d6a3-08de111a5229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?thZpKi8weu78ggFHu8Fr85e7Y9VJ4iDYKzcKGg3/gE03h8dYLQmoJuW+YZyJ?=
 =?us-ascii?Q?KyeQ4NwHxfv+HYxxmAf1vm2lwwl5I3FyoOppEhTs+K42xhHGQSF07lsNn6iS?=
 =?us-ascii?Q?WSxtifGdmAUsS5BKTNBQcFU850+PIzVKptlXfVvDAiajYrhIyshOhxo7ufvH?=
 =?us-ascii?Q?hwR8vc1vc/tfef20BGayE0s6QhrH2kmfkcnV4R6c91pcTzux9sI2OwQHYhMX?=
 =?us-ascii?Q?A9EtVGsGqoUnfk8AOFpFukcQfrwVzEhBa0EndVzSLubbH4Cn+nyOXyvldn0M?=
 =?us-ascii?Q?ZoOYp/giXVIVhI9kjjqjhAaw3uWqlJwNtwbs664DtRVK1Y8ny2nPKAm3Lwjo?=
 =?us-ascii?Q?PRH3KplitseNcml43q2RMx1onBJBKwkuLoc4kTCh9F/mabhK+GLbBnDYLpZh?=
 =?us-ascii?Q?QhMBTYMT/kii5ZwoT1eg7BFwuY8usnKjZVFBYYTDF1HRiBGf6HldqMJlCobO?=
 =?us-ascii?Q?e1Gf462iDGk1a4qXm7HiM4JDc2QP5bExnH2q/9/fcLjLYvKHKmswD6Fqi9gA?=
 =?us-ascii?Q?jVoLPU+Hg9f5Tu4p70WeO8ceMFzt9ej6LDt4JXr1tyb+UD0X8ok5ro44H0GI?=
 =?us-ascii?Q?nadJTNJkSo9dzfBe9T5hC4mE/1i8HDbsgAW4PdijH6DbH6f24kWMZymz/kl5?=
 =?us-ascii?Q?3XIDHfvZf4cjAsS3g/Ba6RjEBWddvlZAhY+5jBB5A6umw9WpCTP7UHcobcDj?=
 =?us-ascii?Q?A38/RdfbqqUrSmXKTibwy0qqRZlthRdjWWWZNJY5lXLS/H/4RAzd38NiAqwc?=
 =?us-ascii?Q?axx7/e2oiTFnrU/LQ0eAs0nnL55Q3xYmKPHTqnst2SRQvYJBeVTwKI7hWFaa?=
 =?us-ascii?Q?yfCp3c0nEw1EJq/P9tEOIJM3szyh9jProVuq5CkttCbXlE9Rt5TKzmYJbp/F?=
 =?us-ascii?Q?ifeLLczJnG/iDlVE8tr5+phn1BKyjHBnByxXAsmGN6P5gQwmCvTjCuox9WkM?=
 =?us-ascii?Q?3ExbyR3i3DtEVqjU3W8gF2BP1xvE+Atr+pAykMh1c3Op6jfM0Gh701agt0ko?=
 =?us-ascii?Q?Tjpmkwv6f73YWj4h01LEdt+EVAaj23ZYLQ5GnLVByOalwPgkovs4JNVKG5UB?=
 =?us-ascii?Q?SajgKnFtjXwNKrMgLGGz3jxxbgS5WqPJZ8vz4xThAF5YfNXaoFssfLwbikb1?=
 =?us-ascii?Q?wNfJbqMesAeuT6hzGBELlayW66+QDXS/o9/lIisARqfqxZlv4+Y9iJksBXZ6?=
 =?us-ascii?Q?WNMHTKEop3+qURDTXIIN5BDU2A3NSFnFkCCTCpGn0vgFg80RB8YtcS8O5hR7?=
 =?us-ascii?Q?pax0x2Xn+faMXX4xCreJqpVtPEkx/TVpom/ZIt5sTKL3xqY8RQ0n++rTK+4X?=
 =?us-ascii?Q?LDPV4wVgPEMgmigmGcbkTrsVaeG03AMDFV17R9n574aOpzKrcHGIDMYoNtpA?=
 =?us-ascii?Q?jbkbmy0vdZY0TiPxRjlJ0MoBCG6iL1ppb/lZOOneFwdNM73ewNsDXKbWehu6?=
 =?us-ascii?Q?RJ1EbHOQtiuXak+OY22USW+zMjhTBi+t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0InhyQKJyfwsBdWnoHp1DXmodnFAl9xvcUE5LCxT7nj7bz35hjZ+wdKJlXm?=
 =?us-ascii?Q?ZMM63EVYFcymC7O2Hq2vDfxNzShIJ/oIMm07BuAJvxFpehwnR1W0URNr8+xe?=
 =?us-ascii?Q?ToGZ6G43wUCjCwkvpjCHJ24T3EHLmtBKcgTDRugBaAt8S7gwIUjpfcq7MiOn?=
 =?us-ascii?Q?0ZJNJIggN0YU4259zjaP4UrFzrCldWWJgBqWF6BS7GKV4kkZMpte1n58PZtp?=
 =?us-ascii?Q?ZNCxKy8N0Jyk0fuMMklGhytdLmRzflwczyviBnkV6taMxKZEDGLTJjUUzJzk?=
 =?us-ascii?Q?vQFOXBautkIlTNPSH0q2kzpynRE3VtkeH3YJTJ1MN5KJWOVudfe59oHl2PY5?=
 =?us-ascii?Q?e55gkleA5EAumuY8iVILEBKa9k7QxSN3pk5IXdBMpeG79Ymk1jgsPsHa9k33?=
 =?us-ascii?Q?O/EuAX/+s8VNC4NEO/z2u2cxwWMo9lpIXfsw7pXdTLYvahgbTBhzjBUxM1Ff?=
 =?us-ascii?Q?L0KK7QczNvQz7Lur8RiUlonuLwInPDXKVXnWuusHkeTCaOSlE0EeNSCRuwEE?=
 =?us-ascii?Q?b66M8dWd2i0TdVcsH9jc0JfiWhGxeTXgAFiAgfg2geYXlLykO7iAmACK150p?=
 =?us-ascii?Q?AzlAGwff9cjO7DZbwWG/jL5oGNmtTWSrT6siNKKs4ABJGMUnTD9/EOgTh6mb?=
 =?us-ascii?Q?0tb2NMaljkq3QPy6VDQ0+LMENeHB9XwSb2GSVr6XwTi0tjsTq39c/JTvWGqB?=
 =?us-ascii?Q?/i8a1DldaJzAEFf/j1PIPkCiNVWZVDPbzpHbW1BlmTdzUaQIJPZfTAgWtHhN?=
 =?us-ascii?Q?zpfRSHVQ/XP0l7BxoHOVjxoIgPp5iUVRK/BGW+/qAFi5AUI56f7+5IxBbK4g?=
 =?us-ascii?Q?ziP2zmVTbtWCuSei69w/iOLEk9gtZi5guDlFwTNe+ITPV+PhGG3rXRNFOCSd?=
 =?us-ascii?Q?AyJO9iYglDvyrf+pRoWHxxVyXUCKWsy0mQbNeRXjz1lWu7DizguPgsSOtqst?=
 =?us-ascii?Q?cXfcrVxj/BC26//SI/MAn9w5tp/5fqy3YxOuq9R+QZxiqM9THqGFRhSJ95Rc?=
 =?us-ascii?Q?4BL8pmDCp6saB/EdeFPY1eOOsqcBWB+dxqC8/AI3yDIOYBNz0jQ1sI+A5xJe?=
 =?us-ascii?Q?89iuj0pwK7wGW6AWh2SN8tQX8nyW4U+10IIU2g5vNGuukjY81wJrlpD6uvS7?=
 =?us-ascii?Q?i0/jyi4KHIsLovzpR8Ct6T92QRkHiptPIYZbB46Io2zdZmAsqQUbqS9VmfcS?=
 =?us-ascii?Q?5gRcVpenMOWrjN32gnHd5jBZEq09w86hG/yk8Gt190lrT+aUfCEs70TVRd5X?=
 =?us-ascii?Q?Xl2RKK9TQyPgs7YoNOvCUEZ1uLUkzqZjXiKBRhpoAU+Jt1UoagPgFzJ4dcuD?=
 =?us-ascii?Q?qgL9DuQ+MrZWNScE9D89o/AVMr+s5Hu8TBZz794BeeCuxk3o0pfcjJd8LMu8?=
 =?us-ascii?Q?8jPhp4r1/RP791Pl6dGX5MPTaQZo3AV6lX3MP35SldN38k4fqDIF2Z76rHVC?=
 =?us-ascii?Q?4y6dqla0tn0pzXw0kfXf0lDKMu5rgKtA7ijCfvuuCRze5pQg6SNit8SqfYs0?=
 =?us-ascii?Q?47DkiFZNWcNOWPKrKKH0QiJY34w3Nt7rX45JeOQgfyk5vvhXitwDU0L5f1zt?=
 =?us-ascii?Q?HN+KbLNl6KoUIcm/s/xlAt5CqHkxFq/pHibbpkaj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/GAUeqM1ZA6+AH94aGU4AQhyNGu2Y4QS/ci3oeD+Z1o+IM/aGp5jyj+TVfG6dg3TBsC9W/Io+F43CGV61unHgEBaVWGsyCvjwaWfrm9gFKoUUStpPxo/VODA1q1QUtBF8wyQQTubaqeFdxkwLLu5/Wfu5JFa+b/Nw4U8nKCePlZgbXdajupryZVRpCPQnK33YITtoG8Y4te+RN0OPFWqTmneTuf7l7tQLPCTJ9IHJQIJDqXt3s69UZOJzBfh8JUnFWIn8mfJnIBoa9WOR1pCrdn/JgDk2b4m3FtRXO+GtvlGfbiHwgUhS6EybBUacnw0bZUTQ7p1Nlup5JGZpqiedp6+F+Rhb3pFG3+JRY24tSvyKoZZYgmhNFBKJveSkpasuIeMU7McC+8//D4sgghLMdVc1es8j55nmZ3niTYGoS4MT7kff94AzWcTbbHihZlEbqzYMY0VC00nU+6143j+1ou0TLyJWBKnoCMRvkeUV5NVB7iR5Ix7RF0xcrKRBp3OjD2NpAC5IlLjOdfwFuaTOBDrDxWd6vKPfKDH5kIEAMxXASAZqpAQUAAZXWq0mjk75lUQAATFXVQMBE9QDU+vyHJVngAuiT3JFGQWhv7IQDc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafb3158-689f-48ee-d6a3-08de111a5229
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:08.0117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rkxrge6K3vmGlizG9OSn+jAiE1YX+NJKQWcy5A8pkZWHgfo+EAOgC/dCyn9K0ux7o5p5S+8x6VfrDyOr4b5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX5EqlDfIpe7/S
 cHyK4h+jc0gvITonIkmoO1DwJtn8yxtQSeu6UqLengvbfT/pKeu3sP6oM6nprtpTvzSG4DMjJT8
 bUk/sFmdfNcKSdffAxji0GGEriv/0GWCV4193ZRgvY6Wo+AMc6Jzpas3TznO+GhtQw1pEYp6xan
 Vh8qxjnt+s7Jry6ew8G3ENlPyJ5GYaHDZFmX0NJ9eZRgE/SMxGhGZSedjI5QfkC0btzKS8RlF/4
 U3clRNM0q3W+H/vLDAJwwZZ9uEpnvg6wqzEQ9fJuzYfCCzCkT4KoYYZwkEtBjZHxA/qYznv9Laa
 aLJw9YtHane653kEZxXMzTeneaq0t2GuUboy+Cu/acCVZByTfkqGR8+pANkDnRYSxg3RDlbr8Yr
 tMPp3S51Kz6cFtWjmIEwZVz11pgVlA==
X-Proofpoint-ORIG-GUID: oTlQVoS2RXgMBHJi1RroaBOpQvw2OnU1
X-Proofpoint-GUID: oTlQVoS2RXgMBHJi1RroaBOpQvw2OnU1
X-Authority-Analysis: v=2.4 cv=FuwIPmrq c=1 sm=1 tr=0 ts=68f84e2e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=rwta7QN-Za_Tw03s9CQA:9 a=-dUJT0I-3oGLVzB2:21

From: Eugene Loh <eugene.loh@oracle.com>

The text referred to "Table 1", which is not otherwise identified.  It
included a link using an undefined ID.  Scrap both, especially since the
table immediately follows the text anyhow.  Clean that up.

Also, the "String Assignment" link was missing its anchor tag.  Add one.

While we are at it, for better readability and maintainability of the
source file:

- convert the table from HTML to Markdown

- introduce line breaks into the very long text line

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../dtrace-ref-DTraceSupportforStrings.md     | 73 ++++---------------
 1 file changed, 14 insertions(+), 59 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index ea44523ed..e9239026f 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -80,65 +80,21 @@ Scalar type expressions, such as a pointer or integer, or a scalar array address
 
 ## String Comparison <a id="dt_strcomp_dlang">
 
-D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
+D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons.
+The relational operators perform string comparison whenever both operands are of type `string`
+or when one operand is of type `string` and the other operand can be promoted to type `string`.
+See [String Assignment](dtrace-ref-DTraceSupportforStrings.md#dt_strasg_dlang) for a detailed description.
+See also the following table, which lists the relational operators that can be used to compare strings.
+
+| Operator | Description                                                       |
+| :---     | :---                                                              |
+| `<`      | Left-hand operand is less than right-operand.                     |
+| `<=`     | Left-hand operand is less than or equal to right-hand operand.    |
+| `>`      | Left-hand operand is greater than right-hand operand.             |
+| `>=`     | Left-hand operand is greater than or equal to right-hand operand. |
+| `==`     | Left-hand operand is equal to right-hand operand.                 |
+| `!=`     | Left-hand operand is not equal to right-hand operand.             |
 
-<table><thead><tr><th>
-
-Operator
-
-</th><th>
-
-Description
-
-</th></tr></thead><tbody><tr><td>
-
-`<`
-
-</td><td>
-
-Left-hand operand is less than right-operand.
-
-</td></tr><tr><td>
-
-`<=`
-
-</td><td>
-
-Left-hand operand is less than or equal to right-hand operand.
-
-</td></tr><tr><td>
-
-`>`
-
-</td><td>
-
-Left-hand operand is greater than right-hand operand.
-
-</td></tr><tr><td>
-
-`>=`
-
-</td><td>
-
-Left-hand operand is greater than or equal to right-hand operand.
-
-</td></tr><tr><td>
-
-`==`
-
-</td><td>
-
-Left-hand operand is equal to right-hand operand.
-
-</td></tr><tr><td>
-
-`!=`
-
-</td><td>
-
-Left-hand operand is not equal to right-hand operand.
-
-</td></tr><tbody></table>
 As with integers, each operator evaluates to a value of type `int`, which is equal to one if the condition is true or zero if it is false.
 
 The relational operators compare the two input strings byte-by-byte, similarly to the C library routine `strcmp()`. Each byte is compared by using its corresponding integer value in the ASCII character set until a null byte is read or the maximum string length is reached. See the `ascii(7)` manual page for more information. Some example D string comparisons and their results are shown in the following table.
@@ -179,4 +135,3 @@ Returns 0 \(false\)
 **Note:**
 
 Identical Unicode strings might compare as being different if one or the other of the strings isn't normalized.
-
-- 
2.47.3

