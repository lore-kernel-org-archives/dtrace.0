Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3EFBA4B
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788321; cv=fail; b=DtsDfmAu1YKYbWtIl9wvzJO11MNsROsplmY6zaWZWscM3QBse4jlQvoUGxyy4HBO7sjulk0NF37k0D83d/aFj3e0HoHPC9lD3QuqDofZk1YRqW/L/OWP0Y9O344lzmJMkI5Xk2/7/VBewVhmHpC9p0P5c41uFFiJGRhXQc5jbHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788321; c=relaxed/simple;
	bh=5OcQaw9M1RtsGWqSrf5Uf9vNVSsQidxKrYD4vFSX8pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f+Ssf7/Hn/wa77/QX7RJQcBo4q3MbAscQ0VvicBvr4AaGFRDGsKzR8gXn8Sug/g9qF9wgccR/YQOi+YNuly36uUYbOHJnLS8VqZ4I4lrm3JV4dWbuJovT6OjJHGk/yzy2ANt5UODqtVASiHBdLDLXCrgFRTx7rlD+ntoCgd2ubI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fywdgAOA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rV/bgpJC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fywdgAOA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rV/bgpJC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OFtgqC011318
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=jwhMFwWAv18W8Mxx/l
	YtBd5FvlXRFZdQD0uxU3Dt1i0=; b=fywdgAOADHC1fckh32XT8uNmNq9mQeR/gP
	zVaA/TliNQ2Jt29w/7PI6WubRvo/LHMtrUZKrvBjg4SkwBt7uXK5MhDYysTf5lD7
	VezUxEVuKGxqTd0h0rN0PZvnbDpBU/BMsUdrYLzMZ7XrQZvDVwcHcTNsBeKmjg1d
	H1Z4SKN+roktVJcEZ7fQAUXNphSgRwfmvkOHEl7q6diGTdvPj8R22n3zA88Ke4JH
	psiUl7rhryXl16EoHB2g6fgeomOIqmGO7bN5yv+s9F3L1mnbxtNYRkEx58NlDAWQ
	N2Nu3TaQlKiPoasfRKhkdo8o4kpD6douHfs1YfjKah4bHJmPHjOw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ek0u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:45:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGVtKQ027434
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:45:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh4kqq4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AokzVS1wo1leKEpDTkS0vG8KNee874wTXk7iStia1mO92KwwnHQw7KBbKvzhJW7dqTGE9dwixhDG4dOlcKe5xCXp7dX+UebpkzqhHOJsq8lpAtyVub6FSQJdJyLEk6g2WRJoWG59WfI/H1t4KhIfDdqzieC4K50OOUerlpzi3reM50FVu9ks5p8GaOqn1yzHipITJTApk7kSmP68mCTw9NQrIwbUdi2uDoqhP5nYYro6v5P5GpvJRjDN4PIPQUg5S2AnodDTEgRC2UZB8BAhcY8Otg9E/PjWkYBmscV2QYTqY5rSKwu4/8aUWPR1Gwvl4s9mZVl/YzL5/Yx0dk5ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwhMFwWAv18W8Mxx/lYtBd5FvlXRFZdQD0uxU3Dt1i0=;
 b=yA1oztZ5lldp13RaO3LNA89/ldTCe/Lc6rt/Badnb8OqNQHFqPcbWNx/thdt2Sj8J7k1kz8gBrxdhKL3xA8GVuEt3O+iRg7wYovFBF3jgyKvtKdTMpPbbeve0MbmTZ7sn21oDWx0LnCm4p9cvb/0AaYSHhL9k8j6h+Gu+zSaU/kglvQ0KiRXm9+nckxENNo/+X7aYP3Og1UH5/E9O1PSGav9vnIr5ke5IQCkr/+LVoDTC2KLiDJ5lSZy0TepmQTKka5tdGXwRhtfsP2g9x5xG1n0uWIBpQYjF3wNanPtlm+XRV0Sxxv3BT2C9s5ACkHNlRR9bjoJ6LRrVo7I2CphGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwhMFwWAv18W8Mxx/lYtBd5FvlXRFZdQD0uxU3Dt1i0=;
 b=rV/bgpJCBON9jX6FYZRDYJsvoSXMqwwv5dgLQc8UM+elaXpvl1ye0YqdpRuFiu6ZWCixasldzW3Pyb9WsWHIUu+jpLEwV5wMZp6QK6R2aOdYuAOERaAyA0xNyCPPlYfhIpiRZFy9dF4lgLgURAvp3mpvkP55fJ1tMwD3xy7foRk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA6PR10MB8062.namprd10.prod.outlook.com (2603:10b6:806:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 16:45:13 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 16:45:13 +0000
Date: Thu, 24 Oct 2024 12:45:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 14/19] Ignore clauses in USDT trampoline if we know
 they are impossible
Message-ID: <Zxp5lcGQquD-RPO4@kvh-deb-bpf.us.oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
 <20241016160139.29589-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016160139.29589-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BN1PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:408:e2::14) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA6PR10MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: d17bf651-aefa-4635-d3c3-08dcf44b3aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tLHPJJqGkJYMJqUpjqr31qCv63A6zk3mYe+rGuruCivwC2K6or0o0WpzuA3c?=
 =?us-ascii?Q?1bsoGb4D89GRRiVo9YWxWKOz8e8uWuXfDdcOpLUVJkcb3cYsv9117etUmo7E?=
 =?us-ascii?Q?4Zqq/q9M7/OpkpJ1v23aUeZ9VY1oo78HOYtcD0G9nlg6B8TPJ+V7qHRKUzs4?=
 =?us-ascii?Q?R9R+/APys4E7/DY5WQNb5HHJlMnCEG1q7y2QGEh31YlqyAR7j4gGM/cHGIvH?=
 =?us-ascii?Q?VxPrWgFKKA2kE0J1vJkqMQXM8ka6DBTm7qvZVCAiUne9CKajt3hI8gbLWESJ?=
 =?us-ascii?Q?UG5ziTTH06IO94GzIGX6iWvRq0lQxqkA0MMp3Vt08w06aOXU76ysrST1ajUg?=
 =?us-ascii?Q?zS8U1USBgHnIaUV7oIBVo+kU9UmdvUTTqPHl3PLQ7YctOovBjdcYaklsvK6v?=
 =?us-ascii?Q?M6OzEuf7XBClyudhsNY9d1KnOqKOG/BJcK/YQbPWH7ApGtICdigffEQlA4jC?=
 =?us-ascii?Q?ULdp3mtobEPXbqLZilBOvoBCb3ayjES/SQd1GuoWBiAX7OM5Eq3o8oGwPnEB?=
 =?us-ascii?Q?RwCLnRw3MjFDRW4MhA9U+IB5XKX9ffH4S5oO3pJUsMdtXzJXSTcJ9Sv3jKi9?=
 =?us-ascii?Q?wGf+rF7okeaziZ1Q+AyLdFFp7D551iK1PDTU+mjGWTaXWNjKzYwOXf0BB0i/?=
 =?us-ascii?Q?y2HpztF9A/dm+ZSYJkxIqfnlpr4H0ULcE45mEHbiZWyGsByA+rjUrk2b2Jev?=
 =?us-ascii?Q?/mn6zvGRZYvVaJW7hg9sctaQAZ8HdYtk/D9cGr/vcBfs7l9cmYpxRPKmsjkw?=
 =?us-ascii?Q?/YDQBLyPnb2qsZxQnLAMEEodpbiuFTuFtTePZZDeKYKu03kx1isqzoUzlL1V?=
 =?us-ascii?Q?iS30OG/ars4t4ga59UdfypYayhXP9tWiRSatfg9BSHkcTBcqKFQBAYgWpC4y?=
 =?us-ascii?Q?FghAS0oHgcmob5g21oIfla2DMSn2DklQaxPtgaUlLFMZx7RLVewYqSQzXOE5?=
 =?us-ascii?Q?gZlREw1C5HWbwmRPlp/SlBohjxhzH6paogg///YY5uiQbtFl0UK+dSaqjiJ/?=
 =?us-ascii?Q?ZmUaMkHKT4QSEccubwoRAOcRZ8vowtDUEFdO0vLxRCgZ8NOP0KwR8Zez3H3o?=
 =?us-ascii?Q?cN+snKfDAa8lpGbdKP8XkgeKhxgi6C/idQ3x7uuprLdVEtGU91MoOJx1gnzq?=
 =?us-ascii?Q?5JfRco2PJYrR7l1LMud4tzrdc+U5t50xRs5yj/8ga3UcMBbepdHJ/iKxmEo0?=
 =?us-ascii?Q?CrLtI4/ONhtisvLWuGpQVo+d+lDPQQOvvm0hGsJdXKCZ9matq8bdVIy3LBpC?=
 =?us-ascii?Q?SFe9a/BUQJk4/k4TsG5hCUrG/3AmsPCtGP7Cpi6Wr5yf5Pmiz847LwlbjJcP?=
 =?us-ascii?Q?aL5jax4faft808/VFjrCAPcD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I6wCx/SoD1f7slvgup13H0xaxcfbjejQY/dl309RXSf0izoPoEBij741cIvl?=
 =?us-ascii?Q?BOGRFm23stQyVRXq94uVt0TTiUgiAS3k2lmLdZcRufMy07NIF0fKZQTuxA87?=
 =?us-ascii?Q?SAWXB6AMSrbgUe7i4rMKpOAY/dRtdlrkSEmKJOx9ZDyFOCQCkEJDPMruAdgC?=
 =?us-ascii?Q?8BDOMHZoI7+shVQlGyE4V583T5GXbtQHOpH+CnOoYIYF6Ni2m5an4bJ4OtRt?=
 =?us-ascii?Q?3Dg21SaU09HIiQ7067KlICmrhj9NVMDjNOO9eeM+tUri/Rb117xAjFzP7623?=
 =?us-ascii?Q?ErmCs73OGBY21pfrKEFTr6IBD0speISAIdK2RqQ9QxhSqKsrPvi3Ja7NhS6X?=
 =?us-ascii?Q?z/8zzIxVF/09/48DlXsY5HTF7UforxvLHfO0rZ542JMBI+h2+VLpSKFpQ3T+?=
 =?us-ascii?Q?pnUv4EklQZ3WNEVNz2cOscDa6v/b5CDv9TBwAa+zK5PcZunXg6iYp9bBPVRa?=
 =?us-ascii?Q?dlph0WuuQ2OdbrYbAETfG6T67xV3Q+5MaEgccM9eoooF4DQol94H3+iHoZlq?=
 =?us-ascii?Q?ynj86k2LzFGw43q3o4sqL74XyCJ9gEOt8XmuJ1z9pW5PSJGMYZqK5JlAtFei?=
 =?us-ascii?Q?ikBvaFiddUfSjk5yrNqn+7qulwQjYZyozjLezQU4QiE1r1MbPrBe18HkRTnj?=
 =?us-ascii?Q?6xF2F8wEvpY99wIkpPVmZMmg0QOzm+iYXr7y/Cas6AcVg8zfcCgp5BFkA2x8?=
 =?us-ascii?Q?CioxZVishBy0Bm1MKL5XbCTE0YB5jSLMgYs0rK4K7fuapuHOMRUy/Bt6B254?=
 =?us-ascii?Q?2J9YTrzsA3COPuXaV7iICIQaLeXYJZCMUveKAcdVzVUMv5medXs+dLzhlkv7?=
 =?us-ascii?Q?mn83bKQjjl1/8wN7IERPF4HF+lU9fVoVFNKgFW41XJRTIXCxcOe3fr4HneLs?=
 =?us-ascii?Q?fp4btUZZTIpudyS/sjeTlJnRg2ExoDgbOsFkWkaoofpoy90WZoEY5Nhl9b/v?=
 =?us-ascii?Q?P9zZdqNGv4a1sQpb6MLydAR/g7CJYNfzTJ4QKLbVLW9x6AlpRmArSpcSwdWN?=
 =?us-ascii?Q?xtaKML9MnI0EgYKqgSxjon3pVzJu1Z937Dqo85FIph4RS3adYwbAyBlpuII0?=
 =?us-ascii?Q?VB8EujUv5BgrEtMVC4SrsdFTMDimO6x8zA+r56CttQ5vqQ2LfcIM6dO1FVbY?=
 =?us-ascii?Q?WiwbaI/PuRJSrsgTN0OZwRGVWMMRlg1NGx/D/EtX4+q35kY8TScLRKy4S1wt?=
 =?us-ascii?Q?tNMN7mmVAxgluDQkFTo8rQkNs+NQyLSTOvwZCKm4wqD62WgCSDvePa654Vge?=
 =?us-ascii?Q?gg0vMrnGB0hnT50vN4HlX9F12c9wM9SfPENNn+OhT95P9r8DCZEIwZ5P44cz?=
 =?us-ascii?Q?nQrO7Od5g8SMOsnz6Ws5y9RD4WByNu/LbjmTE+ZP4BfvgwAmOZTcmVnmJRZA?=
 =?us-ascii?Q?lbwSqMeWULutT3nco3cyyP5cH4CXG2QnQjC0QlMUR0ZG2N71l+mIZWh1d/v2?=
 =?us-ascii?Q?KwzCa5xRk3UDtY3fVAP1Z0bAkN01zdvZhJDOxj/FQBkCaWD9xb0+LhCXUSe2?=
 =?us-ascii?Q?04MRaGTldVdamtc4SzbjBlQMOL/A8oKsce324i5lntPAtg63sJzZyD1U+qG+?=
 =?us-ascii?Q?tPHlGD2NKhkYufQUxAEF+XoS0BcieCDIjFfSPVySOmDgQkzD27dPveqk0Adu?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9cyLXURlpvZD9tYkl6TD6kmjXH3f1qMN6EifKnW6vGrrVYsNYj4eIPdrfL1FnNSt15jwQOKJPIqaX9QjIdZV9tEgbg8K4DRbk7kfl+sJd5jhmqzNydxkGWONXD6e1aTl7sPG+VwPlVXOUc9CQsjtpDXe04PrvYaOjFQ9Gv70LnwqqZj9YiiEZ6K6dW246Kn+M+3+kC9v6u318H0Y489vFd1NLsRKioX+RE93iX8Vhn4TN+0NGbt02+Q8NTs3vWT2SDBn04RD6jd91ajJ3j8/Vjdaay6fQn9JS6RPUF4DOEw8gt9t8e6EuMqCLacpl0B83+BQmZJ334JzLLP+LS6sbr0B6Xq5z7tJi5q0xFw2C/Iv8GcaPMWQpXVDo0ZUQWamSqOksdV+wqpf45jY7LsmJTjnbVUWy7gfFAyj9tvXTzpuVUFh7dF60y9uS1wPkuPkvU/BwBTqbpbVE8ajz3tUfnu012B3uxoQ8/XbpUbSnaKcTGbaluwZLGyMA5Rz0AujMPbkpFRn3qlteEr2YeZy8CqjtJ3O52bXDqxkqAKauZDXsy0XaomUSL2Xkhhbv8/+1+Y3IeXOXa+laLrW2homIMZnnozO6OV94Qv5uhbwOjM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17bf651-aefa-4635-d3c3-08dcf44b3aec
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 16:45:13.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFmJYI7iLCch9AB1LVmII1BHpfCXHWhIpuHR51IjpthrTeRtClRD59v/gpdv+Cndmbt7duiGawIRUfcrUHM6aX0wubdj4fHZzb6wlJ0+2Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8062
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240138
X-Proofpoint-ORIG-GUID: 4x4qdCRxyQMz9JyPXUbHdfHs9ixxXl8P
X-Proofpoint-GUID: 4x4qdCRxyQMz9JyPXUbHdfHs9ixxXl8P

On Wed, Oct 16, 2024 at 12:01:39PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> An underlying probe might have to call all sorts of clauses if new
> USDT processes start up.  Currently, the underlying probe trampoline
> simply loops over all clauses, deciding whether to call a clause
> based on a run-time bit mask.
> 
> While this approach works, it can mean, e.g., that clauses are being
> loaded unnecessarily into BPF programs, bloating code.  It also means
> that the trampoline is looping over unnecessarily many clauses.
> 
> Meanwhile, it is possible to know in certain cases that a clause
> could never be called for a particular underlying probe.  The
> heuristics can be tricky, but that challenge can be faced incrementally.
> 
> Introduce an ignore_clause() function that, for an underlying probe,
> determines whether some clause (denoted by index) can safely be
> ignored.
> 
> The same ignore_clause() function should be called both during code
> generation of the trampoline as well as during the construction of
> the bit mask.  Further, for a given clause n and underlying probe upp,
> the function should always give the same output.  The set of ignored
> clauses should remain fixed over the lifetime of an underlying probe.
> 
> For now, conservatively, ignore_clause() ignores nothing.  Later
> patches will introduce heuristics for ignoring clauses.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 0289c9223..a3c04478c 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -263,6 +263,17 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +/*
> + * Judge whether clause "n" could ever be called as a USDT probe
> + * for this underlying probe.
> + */
> +static int
> +ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
> +{
> +	/* To be safe, ignore nothing. */
> +	return 0;
> +}
> +
>  static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  {
>  	dtrace_difo_t   *dp;
> @@ -388,6 +399,9 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  				if (stp == NULL)
>  					continue;
>  
> +				if (ignore_clause(dtp, n, uprp))
> +					continue;
> +
>  				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
>  				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
>  				    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
> @@ -862,13 +876,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
>  		dtrace_stmtdesc_t *stp;
>  		dt_ident_t	*idp;
> -		uint_t		lbl_next = dt_irlist_label(dlp);
> +		uint_t		lbl_next;
>  
>  		stp = dtp->dt_stmts[n];
>  		if (stp == NULL)
>  			continue;
>  
> +		if (ignore_clause(dtp, n, uprp))
> +			continue;
> +
>  		idp = stp->dtsd_clause;
> +		lbl_next = dt_irlist_label(dlp);
>  
>  		/* If the lowest %r6 bit is 0, skip over this clause. */
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
> -- 
> 2.43.5
> 
