Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DCD221F2D
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913574; cv=fail; b=efQ38BB7g8duaXo095gT6mUIggq+FPXPkeSRAG0TjP6PEV+CDlfF1Ku7+jQx4Uhu+hGHJ3ob4wOry5sriApqyyCO9H5gUmJksZ2Ink3Fe/oeaVxY0HD17c6hppNkVSFGdU4MWvyLphRl+p17LrETIVxvfNgleGf3fIT0PiRhBx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913574; c=relaxed/simple;
	bh=ALV47ByDM1IMor9VgnKfD4pAvqw9J58AfnZlPv0aJyg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XAjJgQdvD9R0s27o6DSUWdJj9KWJ3pcIjfUjiXmmyH7LxA00oNIi9Xyoko4AxwfyOdXcT6FWX0kUpLn6BK8zdR8V6gv2NbKrB4wmOcJJ0a0O5n6r47Eg3qNckOBx1K7XAPVpKN+OVztc2Hk1RV/rTlOhARQMSiEWRPyr4fJHhJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sNMVKDhh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PWlmHp/e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sNMVKDhh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PWlmHp/e"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINkWL031185
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gwvqEx1Rsmai1xOzdM
	mTkInJIGzUV7Qt1UmapO71Gek=; b=sNMVKDhhsiscEwdlLJfOVIa5R4QWqR+D46
	vBHwkPMOGBepj9KkJAwbKjcbAaTN6e2eW59dL8LD7KiiJjZtfJU13nr7b2XDpr/w
	wtRRQQUYo0XRvk9ThJ9PWTFmi3qZPsWLeLBJBtk8BKkMS+iMjUJc9cK6370Q96Yh
	IWW6niylVJWGLN6YHCFGZ9KxUHFZxkDp41RQ5hVT1msAQLZyaB0siCSoxphM6PnP
	MxYD1zobqYiIa6l2/pkQ1AnWPWBP3gV2shmjzPDQfl+ft5mViP4B9jnEM/flGLWF
	bYcnLOxiOTACesI+r65yIYFTU056ATOvNj4u8WN1vzWqe1Z3JbFw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dyv182ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QISm2f034831
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:11 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49dd9uppx5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXLg+pze3fPo1n6QlYhvwsht1ieOZxqRj8bPXN7ST3mLG0KB9CkbCgZ80tMA3Y+m0W5/oyhXF3GR8sJmGWilQvb0aWNk/xNhmMPuKQ9r2t9v0jCngDoNhd1vdzlKUOldHxcZQSe32cTDfzfaeQ1M0HIhNnhtq5TsKiZCo+d68U18pD8HOHMHe3sETncB32rjzD6njR/GyFqEml3xzSKFzpWyvYchZ+/Zq4+SgScfxODJRQ9qLjqyMkP0pA4dbXhtTfTDNDp22vrYOsou1yA/d0VHe7FZlSteaayTcNo5ZH5iOIAvMdcGKezq7oeIoKcwFQyug7CtVVfGfkl/b8XY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwvqEx1Rsmai1xOzdMmTkInJIGzUV7Qt1UmapO71Gek=;
 b=tiTZbOigi8XYNSbJlsKVOa9nLJIDXIBangVf32gl2MXaaAyTl+gmHB4cYwEPrkumkhyvPceZ2Hh7AxGLynyfyRgwgBEgajnBqXPlGOhpFpQUEeMbDCFeuRKt0eTLCbgHpYgdNtl8tmMYTSlJQG/cFRLOAitNRncalQImvxJApAcklknP1dkJQ5KZ5xMvPhkAXxzHINgubt+gzGDxqZRIUXU6RHeboGxb3Q/II5NANIJ2Lqn+6PdvOe26i4eopUFVTlswW4ys59mns3u3bRDmg+UJHOfJRE2u80Ab+6z45pLV9PNioo6c6r8PHRuJ8KJHHdQl+EKCKFcr+Zv9BSVIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwvqEx1Rsmai1xOzdMmTkInJIGzUV7Qt1UmapO71Gek=;
 b=PWlmHp/e6XpsfxZ2PWb9MAOATtfs5LVV/SGViOclnjbmzUz9KcGXfmGpkv8CcEG2cWZxh6jwnm1hVy+dr9lZ6uT/Yd8fepWh0sFMAYTAo0HCg3AJly81RNDLEhdg7oNFUyg5c428hVwLPkomDYY7LB8D+VnuD4I5wHRL6rjiEc4=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:07 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:07 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/20] doc: Remove duplicate id
Date: Fri, 26 Sep 2025 15:05:42 -0400
Message-Id: <20250926190557.8485-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb8499c-155c-4e92-cf85-08ddfd2fbf36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HAfm8nOHkpfckfAkK7mseRfdmNeDhCe3s/Uzpbp2zZZZ/6yx3smEz0yfPrhX?=
 =?us-ascii?Q?p38JIVzohpmwwmb8LLXOJBVV4VnL2ORDEigaUk5J658jSqmxlSfSqD+34YSQ?=
 =?us-ascii?Q?eQ3a9oLVkLpu02noMwMQoLAkItUJ6GwYF92BdYlhDT4M42i8khk8SSuH8a3R?=
 =?us-ascii?Q?drxJRvWnR5e/miQphKchCDAzYGoAp7GzrpCAIwBDStVgUXjv1/5G0YY5vbsk?=
 =?us-ascii?Q?Z/OdGoeMmufv9eZQ+P4MdFRPObdMZMdzSMYXhSCSHa3ECl+qYkJQQYHx4dM2?=
 =?us-ascii?Q?uqYuJThALLrxhXKzUKeRICvvnHzGhVDYNZSiEMESQov3SQ59oyFFKDPUc4Xd?=
 =?us-ascii?Q?omUqQ8qHqJUwiGWquUTMuiL3VkTTfQpENURxVqSqSjv8sc2/UnGl6d1k/Zd4?=
 =?us-ascii?Q?A7O+QqiQxPmpmGyo14a8Aihu1udjRjBBsk1Cg8ZQk9Y+56cpEb9wkAgOi4SJ?=
 =?us-ascii?Q?UdF2agJ+bdvcEMKwUbJ+ArODX6ZJTCcfyxyFap0biDtYMVsQWDUYgay78va3?=
 =?us-ascii?Q?TPJTMhC8RufotcQg/q0EPiKs9Dzue59CjaxGeLR1raMxPB4ML/9CnpY7arQG?=
 =?us-ascii?Q?22UTjIc/jMnUI1YpMbqCxe1L//x9STQWEDsQxTVrgkq2l1wdxPRLS7I1xNFo?=
 =?us-ascii?Q?IEjnFKHKeu+z8YdIjekFIxrcGEtENu674kbuYqLRSfAuMbSpuHBgr7YO0kbX?=
 =?us-ascii?Q?l75woMAVNInVPa/da1CyWktB0xK86xh3mEP/SSiwjcgeKNLTXhgjVBU0ceJA?=
 =?us-ascii?Q?Vhu5MphATnK0kPYOlva5W7tl+8b6E5w2n1YqoB3YY2mIAVmRLZ2v2dZYrTJX?=
 =?us-ascii?Q?NcE/3k5RXHDqdUDkmxMtwaO9GS8bU+8vuZ5MqN9OjOjUz3pa5TdEoOJmUC4G?=
 =?us-ascii?Q?G/+yPYpw9fUyu60UpGVGA+HbPyGxYVt0/jy8C/6HE6ieg36nNDRw1rrnVWYp?=
 =?us-ascii?Q?1mFlLQt8kZMD9lVO2Yb4VPQK6J+0CDZOrSYM8dyzp6AZA4Uqt2x3z1muPYMS?=
 =?us-ascii?Q?OqEaiJefMBAeRBaJL1hqnqNdeWWOr0NcjXuy+kyyKB6GLLzX19pGo/FVCTHK?=
 =?us-ascii?Q?ERt3rVkrrPY0mkjyfb13relHCKadSywpFIUFVSaWHKVufjI8Eo5F+hsGc2et?=
 =?us-ascii?Q?LABNbLJHNZFYidSQ3zCsRZTDRndu5njc1vYSOSXZWR9sS2gZ+Q4vXxwceTKN?=
 =?us-ascii?Q?0FM/p9BLrL7pEMOUMin640fWCSPuDZPxVE5E4X/GiCNIzKRtL5E0dgstjFJr?=
 =?us-ascii?Q?0a0AG9Nb5K6pymp/geop8+nT3O3iH1+ok8VywKdFDDYQ2OdO6zhpo1+JoWc0?=
 =?us-ascii?Q?VrTh9NHRacQZa3LkreVbC9A9UF70bi1hDJQEbBVL4uO9jZiyZU+7N8VyyewJ?=
 =?us-ascii?Q?r8nNg3ivZWbfuYisHm45Hlql/xbJBpP6E9DkWKCX1Sv+EiGg9MzvcdTSdh8h?=
 =?us-ascii?Q?+kFYWRhvNL8dJsKQ2xhxRrseM3wNbuag?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ctjxVvfJX5XnIUsGwR/jqHolVAwr1B1r2vqYr12ESizWxCcDVoSIAOO8IXiq?=
 =?us-ascii?Q?Hzw/SOsShby/+98kaqRYOH9ELAk20t8aLjc/G1je80QoIXjMrf5GPfopQ1bv?=
 =?us-ascii?Q?lVD6nb7Uy8AMjGjs3gr5/ex6rWgWAwsI8GftEfGIBUqa84/Hii+UkjMthfef?=
 =?us-ascii?Q?+LLHAWnaWObWfdnvH7pMZcnfE8MPEFbYtvkllNWpdFOvqkrrALh5+OeWUo47?=
 =?us-ascii?Q?Z2J4QUudR/VB8T4ruMUh9GlzDpF4Hf4b5hralVVvymG1Xt+ZEhQF/l6Zl7vE?=
 =?us-ascii?Q?ZxqvwGRw1CJE/55lIIq4IyozAfd/ZYFYioMrYHkUGK4oXMrctELFWkTKptbY?=
 =?us-ascii?Q?bqZqA5IgrE7D89B2XyH7Jn0L8HuLdFA5KCBfRTeWtHnvveRr72MbN3K5v5gP?=
 =?us-ascii?Q?qR8cK2JhjboDz6SKTtS+RkD4tyOvNl4mcaYEXTIU8DnDtxvTgfPjOm8EE7tG?=
 =?us-ascii?Q?vZfKrHIsza9XaK9NdPe8CXBi6jEv96YuuXPowQlyOiG8a4xEcrsve0T/b8wo?=
 =?us-ascii?Q?SB/KRehWtn5OiTb+0SxD83cTtJA9GG0JocaYPmEkgcV/+6T2nULmkT2YeKMN?=
 =?us-ascii?Q?PFj3JUVR2dY5ynNxxx7vL+5PyifbKTWHC0wRNUZX6mYhz01vR5mTwFv9zb8W?=
 =?us-ascii?Q?XzVPZGwOMj6JxRa1JgM5cDVK7D1jHX7HP0ih0DVlsI5PRiR1x+IJWMoYcMmc?=
 =?us-ascii?Q?drBwKPb/ahSDq00080ZUqyzMF5y9DNvR8yWHJDDFgr0jAkTd3pFJNrrZ76ad?=
 =?us-ascii?Q?Jtm8wm50lKlJqteNFE/1t2tMoOLRMn1B7z/ifBBPYhWIezkD+DNUC6lFo74T?=
 =?us-ascii?Q?LiLQKDtPaxgv+Up3byeeqSJYx73ElfRE9Hf8mLCmuuU5KKHP1awTlqJd7gat?=
 =?us-ascii?Q?zzHSe83tk+ZC3y6eUm1DnCz/x0NtXw5qwjcGLH2pEU4ll1rmyheFfTeYHf/f?=
 =?us-ascii?Q?qp0/CP90ZRnUG5g5z7EgdaBZe6WTGLWPo7xk6JGgMI1fbQOUIly8aeGMuMUf?=
 =?us-ascii?Q?Fw4XjDYdGAjTQyMn+5gnuiZGoYJJv+Ne22Eu2j3sLOnFBhFReUgwzyhtR7rM?=
 =?us-ascii?Q?tPEvl1mhy8UOjR3DrsvpZmO0urPKUcr8Huiir/DnzzpqmwvQnPt9vERmFeQY?=
 =?us-ascii?Q?JacyB1zF2ceOnECeW63dtuIUlypg7rt/vWjdZ/qiKMCdaLhJYqJ+BoFN9NY7?=
 =?us-ascii?Q?qd9SdFikeAo2XelmSIIudom7N/lDPiN3D/ZXHjk1a7aEMs8vqtCBF/enzEWp?=
 =?us-ascii?Q?sg953l6/AHGLR8eb1aeq1MxtuhPzZ1Ls6yoaL5GOLo/vgdnqxHcdZihF78DU?=
 =?us-ascii?Q?vrQfVGRzTrM2mV9clOyXRGgoyFsjID0WfW47aAkKkiRnpnkW8XBABKiCtJ/4?=
 =?us-ascii?Q?jqblHhqQai2k2VeSFT1if60dqv0MWPeDZScW2COTyJztPc6NVABZNYTFaVR5?=
 =?us-ascii?Q?+sCHl73/krRTFx4DNjYuGYRWUQiT0j6BrF4GCXP610UK4yc+PvRcKjmjfUAi?=
 =?us-ascii?Q?A9d4lVLkiBFZcZmS3u/4SNvVt1Kwn3fvVWuT+TUovzO+rkZ5y4tv5AJMIKad?=
 =?us-ascii?Q?aZJm5LmR9f66NY438zAnLHUwa46LLAuzaBlyunPq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6NvNHgs53YIqSI+I39GSWjKTwR3usrOgKG69+AreFzkIKF2rn/AR1agQVSI+fD2zG8FrQhOSELyyLfRDrC5l5KjuEDWArkXrG2iY0tJmAxM2MM88GsTbEsgrjE1BXLa7Br9roW6hK90NQYWVC080xMwlz0V/bOlv4XxMwNKpM7xDMnfgXFSElY1D+qV/qRrtf3BkUlw5Ws4AbsPp6xbO4HSVOYXO+uO9ughhCbUzUrm80s5YYxEdL19eiC5m+KUTDjnsTOs6BV9XYNlWJR355LjokbTuA7vL/g/kobv+p7SQ7Jl4YOPHsQqCa8iljepuwtdxw4CZG8IuWKYx8NzOzn5pofZWaPBrrVsXLO40E6N5O1dJrS9IUgs6Blep89Mz4iUBdyZIAsCP3+brUnvcJFd7Twr0sZsSiTXj43upzN1x1xqSe7hr53px7BwzVI17Utk4dI/k7j4BbH+uZxDaHisA8kT19QG4etdXhGGHuFG6znRVnN4puBefbSRQ9Wuf5/KtjjZ647Y+J/MSxpYvMmeDDi/z7+7zNvaNE7e7JL7RpYOzlJnlU/hLIHQInL1SeMVWLo1waeznKr1tmSbEyS22mNOvYy3E95Lzfesfeuk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb8499c-155c-4e92-cf85-08ddfd2fbf36
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:07.1616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkgN1Z0t63ZMROuyq8H8HxsnboZ+wRbDcusF4dNHYwhVS1GH1ZSvYaG1jW+GIx32TxkkF0f1keuvf553PNgLwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: 6H2vluZLEoZhgkwG3hDp78LcJ_IYHB0f
X-Authority-Analysis: v=2.4 cv=PdDyRyhd c=1 sm=1 tr=0 ts=68d6e423 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pocrWxXa84N-BMzY-54A:9 cc=ntf
 awl=host:13622
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2NCBTYWx0ZWRfX44ff5S/fJJRY
 LJRRyyMCe1DB/c6kceAmAN6HIe/Rl9SA8SOkqRAcKwNyAzPUgp3zJJsD+yYb4DtC+Wi2VYdMMqC
 auSHkuY1q0LEcsMXJKuHK8Co6CwlISxzYBR4pBj7VRvw5NgIAjhnUsQGgYMo0h8epgxRGHHBNAS
 yItuWIMUoMpnG49ApxYgHFi4CfksaLCTf9Pqipmg7S84kMxI7EAWyfgidH2CFHJ4pis9jgoZl3I
 fm46fTdQ1EEFVvYQEd8u7ulxtPVi0YFIYOx5Y2c/rrN/vhrWXmA3mLJ9Fi2cWk2phruL/dNuw8U
 uN4bo2j1DmEwmoNuyrVRJ5Ba1dzaadzO2L+5pPBwzSg1mwWFGOUmowOoA+hNqDJW9zxC24BEprB
 VPzi/o+cj1gIUILva+S1BsZ6/oU3nRTfMFuiuW/PhQ9G8yqGROs=
X-Proofpoint-GUID: 6H2vluZLEoZhgkwG3hDp78LcJ_IYHB0f

From: Eugene Loh <eugene.loh@oracle.com>

The id has already been defined above.  Remove the second definition,
which is not used anyhow and we won't be needing these tags in the
future either.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/dtrace_builtin_variable_reference.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index c9a7dfebc..be91cd81c 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -169,7 +169,7 @@ However, in probe descriptions, macro variables are expanded and concatenated wi
 
 Macro variables are only expanded one time within each probe description field and they can't contain probe description delimiters \(`:`\).
 
-### Macro Arguments {#dt_macrov_scrpt}
+### Macro Arguments
 
 The D compiler also provides a set of macro variables corresponding to any more argument operands that are specified as part of the `dtrace` command invocation. These *macro arguments* are accessed by using the built-in names `$0`, for the name of the D program file or `dtrace` command, `$1`, for the first extra operand, `$2` for the second operand, and so on. If you use the `-s` option, `$0` expands to the value of the name of the input file that's used with this option. For D programs that are specified on the command line, `$0` expands to the value of `argv[0]`, which is used to run the `dtrace` command itself.
 
-- 
2.47.3

