Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C2E26B971
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758661521; cv=fail; b=s6ORwCqW2KO4P0olcVWCbuLO3teodQKsHezNAwko+X2+kpjAknGqg0RuFcdmQkkaLxj1ckd11BSE5pPmts1IQBebOwa/JjIl8NYsmtu0wmiRsq+k7EBKqlz/RJxI5RjdNarAZ1NkEvndMfVx+lTJj23NINu0j3acVLYbUbGNO48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758661521; c=relaxed/simple;
	bh=GIPW//Wjx/CGccZcRei/ZmuErhyZoGlT4nY2chWgZpQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fgnk2nOusxSWyEp0ScC0ZHEusBZeVLK8qaBf1Xz5VIFwZZAjeCLfvKZEoEwO/J26ishxYmmG+4m2BLtW4tSw2AXE/2KEYqruHiueJl3w+7Q8GcB+x1SDMUrFxqK+LJTZ5pH0+zuO7wmbMOafbk70KI4flnwdHwpwxqasXQy8Ahg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qf1/pcS6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lL/umE7D; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qf1/pcS6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lL/umE7D"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NKu0Rf023266
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 21:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=FTvEbSk9B5Y+ktthMR8IZEx/qzNdGAakEz84C1wO1mI=; b=
	Qf1/pcS6PodZNsPbfI/jzR40EbLOE+hHd8XvmYxB7/jHa3NuajhOdtc5NjcnKHsB
	y6sjZg1ijM5V35pyI+f51/xYPOf3Gq0CgAu9/yxBsfliSrSqBT7VrE/JBUF+kp+k
	qxlnYDpaGjSYNTAi5jVFTgdwbX6HAxCoFMq184JPWdPJjFUhYOUwbV/nqwYUMZex
	vlXs2UwzzPNl2EGXc02n1xtatcH8b+ud4gTsYurcMt9PVSIbDVlAxE9DZ6a4xqav
	slgbVjmYHYoFjVF+uDYTNrEwXpWFekUl3Ii13GZsd7TQS+0P55EJ0UTEXoZI3suf
	reRKj3YhtsU6PloSQHLeSw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mtt5k37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 21:05:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NK3oOM013604
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 21:05:18 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8skj1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 21:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wY3DUBqh63GgapIVQiCTCOe/LndOdij0pEUj6jLQdOntmGLuLuXFNdf+UtoQUGjyCBDq9mMoCdrF7tAoE7fOrlGLVuw8VRYhB+MiVhuW6+goGMYmZr4YofEX74OwtKp0xC2hT5OOjrLVBVprlPKmoM8ousmdcem2VMopw3XzOGFJ+6nan8VtM8KrIz3xJNJxK9CblMal6+Pi+hDK+nlNpUlofoM3j1+VYuZKvgr3chA1TkK6t/3QuYILu8DpxANWNrb+ikaQBMjBOEf9kqognvB92Dj3snnZRmgspiMyhwab9H1nSAT4l95HmlkNHuugk2NXbv2BmXXykCg3Fqy1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTvEbSk9B5Y+ktthMR8IZEx/qzNdGAakEz84C1wO1mI=;
 b=wmdLn9HcChZ/gA/hgwUdoQL0na8pcZ3x+Xmv5I7AnYOZlBliiYC00Zcjv6hzkkfq4+y1iQE/k9sLtMvNR46qFpdPse7vaGd1TkCsDDtF9M0T7iHofDQTv2wdzw8fvok08SMen8hgPVpJ7LsckCHQgCuP+lNR3/AEW3mhAnPibbxYIDV9tFMdp4kLgIVyM594dEx5GzW0mk9OSaodUJfTUBPn51P/w6J1azyUTeikdnseJupHQXEjOMUm17Lyw7zWSg8WAzdUQ9Az4/nlc3bIeS0DxqtmTJb33lsj3BTYihY9jGhjDwg5OHLmUCXG7Qbj/Vft4/bm09+whsprTA8IPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTvEbSk9B5Y+ktthMR8IZEx/qzNdGAakEz84C1wO1mI=;
 b=lL/umE7D0bH55e0Lzzb8JgYgvVn14YZ+cy5GKvUH77e+Tg/HdYg8AezMnOSNwzKISvSE5ztaiFxM50NyvwWWrGjJjF2kWYv+clzrXKiJKWXVTA8mK3nZDR/r71s60HUVZJqODjcNPBqCN3jDIqHAC4jyQrbP8s05eDfqSPuS1ss=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB8008.namprd10.prod.outlook.com (2603:10b6:8:1fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 21:05:14 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 21:05:14 +0000
Date: Tue, 23 Sep 2025 17:05:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] cg: fix masking of lower 32 bits
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567238056385C0BCE6329EECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae9ee8e-ae92-4a42-d970-08ddfae4e3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sYqgs2WgtgmQM3xsVTIBkHUHkJwjw6cZ/BlNEwDzqWLBdmRxnsxqcAc5yKwQ?=
 =?us-ascii?Q?if19q/QhmZdEaz9EzjiGvMaoo8hGR1oX/GQU8WwPPLwA7lCTV8XJJufHTVL+?=
 =?us-ascii?Q?LlL308RIy1AkqSSdNC+rlj20Yh/wBI/IpB9HDPFV0VR0/VpbIjFVWyd1LncN?=
 =?us-ascii?Q?LoP9TK6qXZLHTI6H+8AgyelXXAv1N35nAsdwenFwbcGhqWTcxZB0EqC+CQs7?=
 =?us-ascii?Q?P7V3NBfG+PghKsCaFdKQ8rqZcFI0mvY0MD2DVBAT99W/5ZOi2bswVt3ebUa8?=
 =?us-ascii?Q?0jrBHWshH2RRvcL/Xq8sosatp3iXVLuQLGgKDOk1/XNstI3UP3rrsQhMi6mf?=
 =?us-ascii?Q?MznF8KMaXNp/RgdG/ueucNu2xjW71n5vWRLH9TqNYCdhDI6F76T2Z0i4rERT?=
 =?us-ascii?Q?paXXxN2yEfbpQlRUF9slsWf0flSgtdACnDh5ET4vLnmLhnW1W79kGPkov/6r?=
 =?us-ascii?Q?lou72BnJwQsxWLcHjBYG34BI++rXNehAfQU5J/kpbL1NH052NVt5C2S2WzlB?=
 =?us-ascii?Q?ozm9qGhqEHJLbZTgsrMUTP7eywBy432v2VfdRAMDvnRDSUtNC5pqcDdI3f4l?=
 =?us-ascii?Q?vP9pRpWVdfXy4XQOvq5XqqgxFsWcBoCxIBVzBVH823bGvGzEJaUMNAXAlcwt?=
 =?us-ascii?Q?n1HVu9PEspRt86JLH9xZhwD4BJh1OPaEAT8NDgueq2L2TM848l5GtS6vam4x?=
 =?us-ascii?Q?4vgPLU5weOOzlXvBOXcPi4gBH6gjcWxagGLjeiRQdhrj02Vz4RY12yS+BKbC?=
 =?us-ascii?Q?Aax7UcoDGz4+0S/RLS1h5ijgKxtkNCx+RpQoyIoLiQOc4FXREkvnQzxew5+4?=
 =?us-ascii?Q?FikpyjUOgqEYGS4M4eEuHUG7z7wU/MDkjp5Eeyh/qenXLtb/hhfSiDkhLUxH?=
 =?us-ascii?Q?F2RAmwzmoegrdYCrsBi0PZCNGrwbDax1rgyWHIIL7rsd3enShOLA6zGpyQ1X?=
 =?us-ascii?Q?DngmiDztQzoickLzMUb4DbfIArFR/MowzUiFt2Uo7EQmCgDOG5HKtzvOIWP/?=
 =?us-ascii?Q?e7n8DUu1aqM0Hqnl+zOExno8I0S2m7yrCrdl9TowMkGc+MANhP9ZjWAOtWnB?=
 =?us-ascii?Q?4mYnF9mHz0CKFMugUfAootU35nS8LFylWraWHqLMVgutj/bGkaFagA/9lDAe?=
 =?us-ascii?Q?JA7qI+oYnzyPcpJKIUBbjXa93rokT7O7dVuC++5yIOSPCddfW0O1E8goVpGJ?=
 =?us-ascii?Q?I+Qto93UqrTHc8mWdtUCZhmbpbsG7pwyHGjKsnxt9zCgxXYyi/YTEV8NC+a/?=
 =?us-ascii?Q?hKnUnwGyItE57HPjm8/iUtcADFW8SBECgBerUaGUQgC4UGgXU0o4OFOJHlqZ?=
 =?us-ascii?Q?vsOmpK+upy6CcHKGcgI8Wvve7xneftSKAElVDXsgLhvP2pxKHvbTwkwHhNib?=
 =?us-ascii?Q?Z9hcdWz3WILaH+cr0u4PLJLCe6etbG1vVanyUAhFK317IRPa+JhlC/sfxl9g?=
 =?us-ascii?Q?B8eie1mQOmo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lGKt+KqwPP2D3q7H3tgCa+kZTGTliPiworrZPH7gTvC6lgjeb1gS0aJqS/mc?=
 =?us-ascii?Q?ZMAXtH2R967O6vCaL+p4Zg/0/8TAlIXdfOyyMsIUa8H8C8guZPSO+dbEHRTn?=
 =?us-ascii?Q?+AhypWDRKJoygqjX5m3z8ND+9Vrzgz6IeCBdQRSmQp8qmKCUjBpaP4/RFvsM?=
 =?us-ascii?Q?2yJ/CB+ClkhErE7IGdRRGuH26lqm6HUEthIF4HsJ5kdBrhL5bnjLjuJyNO7d?=
 =?us-ascii?Q?AC16ARuzP0dZ9h8Iic1fkEjJqJIkxlUCJJUf/fO3K9P6t5h9q6VacsauLhks?=
 =?us-ascii?Q?jEDfEg8cgvRP6LfOv5FbVga+GJ3HrpO8RfSByEYQHXdUu5EmXW3vbvITz5DT?=
 =?us-ascii?Q?wdiwQRGbY2waefGJwJGfB2732I687hp6Nh2EP/qej84Pz0gI3TsNpaIY5W/Y?=
 =?us-ascii?Q?0DwF9BH5me2gPPFjedY9HD64u9RGIZxvHQf799qP353S9P8D/Y/GLjmd5yfM?=
 =?us-ascii?Q?/w8LSxOkCZMO+paQGWBkFAnnepDOdZKgwvc2rCCyifSwM1FlKud1ZKrtTxVr?=
 =?us-ascii?Q?HBuuAMjcIXqXTvmuRl3kYg0Lif2y7jvwSIEhpJHO9DBIGNvlZYmymatw1Hsy?=
 =?us-ascii?Q?5Q7A1+qU13c8xs6m4kDqt4jGutqvMF/bag2uaVy1gTnKglwxcWpjwlLY9/Hs?=
 =?us-ascii?Q?ZJiDfd26uurJ+XrwvbXGSYDHEUmAYICimj1OYQxf9lpzEXqKgtn+7dvFkM1m?=
 =?us-ascii?Q?hq+M2WTF88Ap4e2R+KG+meFnLSdmKx2JhT8AV4RDbIok6HRAsFiNUeWKAXLN?=
 =?us-ascii?Q?E2Fv74viWSOEYqUuqHpWI3T/I4sstt7Q4P/3WkHbe2OkfbRzbMAItsgAJa4l?=
 =?us-ascii?Q?uQYcJR/MHPPRS/yk5CVgax4Q4vZeSDpopD6iqpMgQnqDq4SXPHlvQRfAw6lf?=
 =?us-ascii?Q?Q3ctZJXG4I5Nbqd0wdo81j+1nUiTbYxTBZwapw4ZpwRH+g8jGv48bhIrPGHk?=
 =?us-ascii?Q?rFzYmUOSg/+3k+DKQASTDXkEmE33cNmaogMG/APlS9H6Mnpxzb3SJGMRSL5Y?=
 =?us-ascii?Q?uFXGpyDRb0Yb2s0acHMdS4CZx5Vh07Nq81viPPU2byHv5AtaO6i9cCStJyo6?=
 =?us-ascii?Q?Pc8khyWFgprQCEhtl7gFk4yip6V8aozewe5F8plMBGw3HR1PdipE/lOLZUTe?=
 =?us-ascii?Q?wLn1oEDzmzDvJ4ndWnnphH5+oi/RZnSI9lLwbISmfyTWTxJ7DKY4auMNZs5l?=
 =?us-ascii?Q?dR0ytAw3AhYv4PxrZo4UTzJGkGob1Kh/rP7gpq61BxISoAONtcw61yI23LoZ?=
 =?us-ascii?Q?4EXkZahv/89IBJWmW6uHYUD4jpxfiEguOKl7JbPTaTYhYPY8HuRCOLv4ZVD/?=
 =?us-ascii?Q?r79YSP+v/IiqnCsOBqlE4iQt6zHT3oNpLxRNPgjXovAtOZTNU2oCaFYH+/pt?=
 =?us-ascii?Q?s5OtY0GDkUMHgwoTA/iynv28XkD9q8CnlfdQ44KOed26KeeTPG3yyacE0kvO?=
 =?us-ascii?Q?3DBk4bli3uAsusltbKQbIg2u8TjjKlMMUTqWrUI0LlW0RIrO7NTGN/CpzYMT?=
 =?us-ascii?Q?j1NL3TMRzs8bBeit2v72sa689FKZI7nGUEXYmz4RbLvMH1CtNQpLXsFGArGv?=
 =?us-ascii?Q?e2YXdPT2QM7p9r/GJE7Y/mWhtiQIvjsTZOlagj4xEiPHcoXY8H7apOcBpfwq?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vi+eCxkIm1K2fSJpENunjew0iT15LAGOvrXjlrVXNlu8zRGLMfXPGd5UKpGJdEnlyVWaHx3qcS8/KSxJwSz6LTxsweXuIzso29JQEpWo4JuvxlTjjAXHaEEO4Z58AuP7NvlJZUvVegVHXk0B6HGuapXg+Qvlgii24YOUSpy/EnBFKn9w8tdIUtpWaS9rxZ1mnJhWxjXpP3buBxjYq3mQb/L91fiGy5eNK1cP5QaDRTbc5P9cgaJtUH7Rw7N+97gQr8VFsUPmIGCVoUz3RZkoIlTvvQlO82Wc2hEUemZrSC6yy7tegxweBAKExko8qd4wYwJktV34GfzQkqDb8uXTzM8Pbzi6uV0CvryUWPFpuCecJ0QxIruq2g+2eXzIBzY1ewrhB2cVJ4ToqDgV2+JYlmj+JI3/j1IwELRzHFx0jG/RwFYOFjXy4xOdFFlJR7nmf7QTp1xg9Pj7r7h1CKT79kH7rIOgX/S83h+KkkHcU5ptsiOrhkY8KFEpflXSMDKnMpZ7kjO1fS0Bx2E8x96S/y+dKnRPV0e8TNehF/I9aarnDIYUtVt9HQs4vPASOCTEbrsN8QFPI+KXg23+6fV90q0eV6xq7FwyFZrAUo4PdMg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae9ee8e-ae92-4a42-d970-08ddfae4e3c1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 21:05:14.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49XBsInddfBmv9UfKxwOsQLnOw4xJ5dWta0bjfMdvXqrwkrlOsVLW8UGRZ5+SQDffLiBIf7vscvsrKXoN9wGpOlS+ZRKU93ma18CNs/S8sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=954
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230191
X-Authority-Analysis: v=2.4 cv=fd2ty1QF c=1 sm=1 tr=0 ts=68d30b8f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1kPvXq0XW9ibrzGFLOcA:9 cc=ntf
 awl=host:12085
X-Proofpoint-ORIG-GUID: u2yFbszJ3X5Xz9tdtq9mfew8FgaZkTJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNCBTYWx0ZWRfX6hgyJZH2NpCq
 GSAKTb5wSDeQT85jS3F6xCsSuLLswgcmwpWrOabeYGc5K5/F7BNpGA4V7zqC465w5cl082fvInz
 6HEFOkYW6pO/0JaktomR4rEkfVu+lrksk1HF8AtDAbCu1lA0K1jqp2YTTGuZS1VeKAISelaidOw
 41Z0jwMaahAd/UxUJ6LITjOj06D3fVR8EK6nWp/grTg1ejJqEbcVAdqwZVwI+W5Dw8zuxO7cRxL
 iHBEn6+c32SHzzp/4CJf+rHucTgCT9ldjJvJ0UQC/CbHaPSLJF/G9yYGgn0/2xQEybKKRvcsoBt
 MNdLzvEV8sHvb2PGk99US8JTEo0suDwBdYAAgnBzCKKKLnJOjoZQLMgMx568/zQn2nqJ1Tgk7Km
 jnZ5sqZZg1OQDO7XRUgArVhvp5UbxQ==
X-Proofpoint-GUID: u2yFbszJ3X5Xz9tdtq9mfew8FgaZkTJG

The "and %r0, 0xffffffff' instruction does not actually mask off the
lower 32 bits as one would expect because 0xffffffff is interpreted as
-1 and then sign-extedned to a 64-bit value, i.e. keeping all bits.

The "mov32 %r0, %r0" instruxtion does correctly mask off the lwoer 32
bits because it forced the value in %r0 to be a 32-bit value.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/bpf_asm.h | 11 +++++++++++
 libdtrace/dt_cg.c |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/bpf_asm.h b/include/bpf_asm.h
index 152d2312..63987e01 100644
--- a/include/bpf_asm.h
+++ b/include/bpf_asm.h
@@ -36,6 +36,15 @@
 		.imm = 0						\
 	})
 
+#define BPF_ALU32_REG(op, dst, src)					\
+	((struct bpf_insn) {						\
+		.code = BPF_ALU | (op) | BPF_X,				\
+		.dst_reg = (dst),					\
+		.src_reg = (src),					\
+		.off = 0,						\
+		.imm = 0						\
+	})
+
 #define BPF_END_REG(sz, dst, dir)					\
 	((struct bpf_insn) {						\
 		.code = BPF_ALU | BPF_END | (dir),			\
@@ -68,6 +77,8 @@
 #define BPF_MOV_REG(dst, src)	BPF_ALU64_REG(BPF_MOV, dst, src)
 #define BPF_MOV_IMM(dst, val)	BPF_ALU64_IMM(BPF_MOV, dst, val)
 
+#define BPF_MOV32_REG(dst, src)	BPF_ALU32_REG(BPF_MOV, dst, src)
+
 #define BPF_LOAD(sz, dst, src, ofs)					\
 	((struct bpf_insn) {						\
 		.code = BPF_LDX | BPF_MEM | (sz),			\
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a8f2c9d2..28b7e7c4 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2757,7 +2757,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 		dt_regset_free_args(drp);
-		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
+		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
+		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
 		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
 		dt_regset_free(drp, BPF_REG_0);
 	}
-- 
2.43.5

