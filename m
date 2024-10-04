Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EEA33FD
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017045; cv=fail; b=AMy3LybsYj6iQBkNVBg7zyZZ/cWR0QjdSBIWf+uVV7gVkdH1c8/qQFGjL8mmmMV9QJiUWDmvBEzjQOF86b4djdsWbeZdZ4DHUJ2MNTMeMvPqwFxif28bd9cCp7Z4wjFsk+7SV9xWz56taiZziI5BO+AKvSFyDp3enhpprKXcAZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017045; c=relaxed/simple;
	bh=05/cXZEH3lZQPbHBUsUPMpyJFq9JLcmJ6A4vJZ3kdmk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JwF4CV98dg2iJd3q5g4JLYQHiqaaR2k30lYIZxvBHs8sBm1teVS00k7dwXlWZauZweX6vzseuMpNfY6exfshv/IBMMsaYdw41LLvxLMjP9ISUkrs+Mw7/2ZrVBxyd8S8UeFAVhNsHmxZhiv7RTh5Tl2ecCThTBgA4274PCr6dVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DfxsoL6k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G72RFGSd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DfxsoL6k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G72RFGSd"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tgML027195
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=3raTGp9UW87KDgHpHLR83b7CLfgO/eI0axqP514SFG8=; b=
	DfxsoL6k9rETJM2jycfjyURvru2Qcc71eem3NmAmFHKpjcZPv+Vk5/1+ptdKQ8Bn
	FgBP/+v+Iqb1snjdWzpZVixwKpnQkk3T7j36CV2mppkeBz7p0TyXNCAJ4wq1Q5hO
	xjzgX6avcxn8xBIa7ezhtzFgZvQ5Jo2zJYb1IdpFWj2hOP57nPRJv/oZJTdyu2K9
	c0s0xFNDgjZQtYmAHBQInt/albTCOfNZNU6cSG80b1yrch/vOOjYI3qO/zspd+fN
	7VnVKVhfkSeO/r35G98d27INlPjZJp7Eo2BcWSTmv7r6UsOA76VoQPQ7p70nkJ+Y
	j7rpnoCvVEzVUclmiJ2+FQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204grspu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494427im039058
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422054s8u7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRM4GFqtpOmt8uKQn8i7Z9nQjMKUZFjenBGbPlJkZmkuKv6BF907QTHfT2/73e/rzKIptgfamboqsSL0kUcfPKF23ibpYq9KqXyDqhS6EtDingynP4pI3vzaFSOHD4sCttHGDBFwJKBfyzduCruEKY/lIy+dyAoVdECX0LC2gjrzsCVt22tG8cTDyV6ONG0cvhOMKxPnfAvMevTfdTTCDRPeT4eSnz+KumixuxihQE9oeY00vpGS1KN4MijxVghgUOe/vdYf7Gse6epj3qJhh23w38OT7ihaklJjAvQUHC3aRK5Q4vWgNakjRd2oXGtk1zdSwo8D5L2fw5o450MXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3raTGp9UW87KDgHpHLR83b7CLfgO/eI0axqP514SFG8=;
 b=ojC6mEQGqd8P7WKwBzc5EXpa5pw+ZFb/uUcsqws3XIQD8h4thAqbqO3YPZOzGTW9vS2fQefQKDnkj0UfZ37BZ1QLVS+A6L8kGPhdw/1pOhkSHq8zSoJxUfLC0O8TvVmnrYAiIfdlUxRA4olPvHoCD7M6mKIuiLNGZQceA7cfFbzge3WmuZmzbXPIX7ZS5gYpLAh4o4rnNMVGOQ5kF6RdsZMvgGOZQWW0Ndy1vn435scx6IaLuvX7Q6o1Xerj5lyR9ZcI//1ATzl8+mvctyfcxnQ2pVbxyxt6AzQpNmBARhYaUTbWDx2tkEWP8IMoinDJRXmCUcS98jTjkZx9ZzgKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3raTGp9UW87KDgHpHLR83b7CLfgO/eI0axqP514SFG8=;
 b=G72RFGSdsuzsz7qgBHths792Dkmzd0fb8krH9prLLN0qVq8X7MbqniU0ABaAarzRpPXsX+HZ7a2ICd1Q9wF5fFOjsHzB0BceDnAOMA7PDT5092PTZf9MT7Q08/rhIrmiJEZrPuH9vbUigGsKSNk6A1VUA5MZo+OIgkQLnHi1XmI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN0PR10MB5909.namprd10.prod.outlook.com (2603:10b6:208:3cf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 04:43:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:43:58 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] Tweak self-armouring
Date: Fri,  4 Oct 2024 00:43:52 -0400
Message-Id: <20241004044355.25870-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN8PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:408:70::41) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN0PR10MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 21565e9b-0373-42e1-cfef-08dce42f28dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w8AWSrB2Y4l8iJcTAL1xQChMvtqzRxglAqEEgMuVhHloZc5G64B4i3mPKR2i?=
 =?us-ascii?Q?m7/eWn9JjNYFk1f6yKlStub4CsvfQ+WKh8vwQE2S8fAxlm8H/7lp3XpbTPc4?=
 =?us-ascii?Q?WGk3isjs13Qg6EGpc3fUs9N6lAy0it6v4+3urVBTyFob7aIVFY57UKcbMfpi?=
 =?us-ascii?Q?azD/ALsr5OrbnCN5UZWjtajkfegXckrGWBiQF6Up2rEXzRtJxEDUV0rk2kSm?=
 =?us-ascii?Q?dwXnhwAfA0zCvVVlI9CUx9hxC85PO5AQKq8OsnLUPHGM9gC0tzmdnSwNgEE4?=
 =?us-ascii?Q?5FIqyriaQRJtVchmYoAa8wuYM0ZFhjZxsDa0VpcYRkamOO1TETcG7FV+PgBl?=
 =?us-ascii?Q?/l6spClsuliNu7SxzhIOofS/4mhRnSjpKkQ4fmvCGFCKxL8jYhkR7yN1W5W0?=
 =?us-ascii?Q?79KG7jFi2phxXfa2RqJC/8po+47ie51RzabXygoekbinV7Obfkd4y8heOrLG?=
 =?us-ascii?Q?3ts6KKANx+d/1NAcfwrhU945LlYqiPGWq0w7bAnRNaoUo4yk/VMy7VKDmxtO?=
 =?us-ascii?Q?vHl4N2VUyFXmuNY6qmYGpE2QyQqpFMKGKaye0G8o20dcq2GyNmDP36BcXUJS?=
 =?us-ascii?Q?yfuqg0Hp5v2BPrG0gieOjYW0FlK7OAAYIlrYj4wo4I5FiCwPXbHckitssKVQ?=
 =?us-ascii?Q?NoCyZMlXAI//fjlRrrzz8cBk0Du8SjLgF26f7fAMtQIB+ssy7IgQjveruZdY?=
 =?us-ascii?Q?c9Lnt60z0tAO+hRFFfFlavUCbAMiOGM8NRjc/wBRZ3CazESe6nMAS/c8QRIa?=
 =?us-ascii?Q?D2NLXujQkvdR5WINy/2mWpodvNKIAVD/ktRjoE4dgTfkeeUfxljnLdViWN6I?=
 =?us-ascii?Q?vuB/HNCFdYC/mE/0OwGvpIWou07egc8u+SmmlW1FOzd2NlwzE9ezx+w2tiz6?=
 =?us-ascii?Q?Hu4nFCspegDsRrZp1jTLLm4ufRfbm6QtXvViVJqBs6yoTTWJbEsH8g0m9DzB?=
 =?us-ascii?Q?gbDx6QwN/TGbzBcAhdz3eED+bAa7l4RPTH3zmcQSpCQSnK/Fmpl5EMlBBOIr?=
 =?us-ascii?Q?y1pW1nvI1dnp9M8QCLuZDhZYvrupTUuX+Wpvyip/V4COLmNq/0m94Fihyfs0?=
 =?us-ascii?Q?TDl9+1MUdMiur25GC6vM0aMBP6Me6R9vt3Etqj7j4ze/v1PJTckISUXq+bAU?=
 =?us-ascii?Q?Q8AEK3tLv7xOHjosTbbk8gsOHNRWxoeY5BUlJ7rfn+IJa7UQkAcSW1k7i4Qx?=
 =?us-ascii?Q?+0dcqab9RZrhdIwjAQPxPduQa+y8shyucl/yl621/JGeRVGGRlTVr4dMh5gm?=
 =?us-ascii?Q?jTrj4p/qADT9OObLDo8m3qcRW8gaO37iG4NovmiFTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TX2PXNGV8JFVWtgNgMPknpGgdesBxWpanX8xO6agBWHdZTgp4LRY1DsWVFtZ?=
 =?us-ascii?Q?u3K78WMFURRaH4P4wBKUQcO985Y0mtyew/DXP32cepaipdEEQECPMinbumbL?=
 =?us-ascii?Q?RBIwcmsAJ9KB7Uixlw9zbcDs5uTpGwuQkhWZ7eEgA7NmNQ7X3Ef2R4KgWWOX?=
 =?us-ascii?Q?DvII1pScILd9hhWaDLdhSzRJZmcOeFjK+3gkIMVnlhTOur+aLUlK93BZ327V?=
 =?us-ascii?Q?ADwMPXFRNJqlgGW71RjZKPggCl0JhJwZrS68mF8XR0g4WSAPntoM1gAe253g?=
 =?us-ascii?Q?txOoTHrks2MPT7U0za3KWaspIueryJNVNuqpzYIofdF73dnQ/Os8KIUZi17P?=
 =?us-ascii?Q?zHfmrjSpXmeyNQvUW7hlAsav0HU61IdI2+6ratqKexxwEGXnSvtd/2O9rr9I?=
 =?us-ascii?Q?MgWXGIr99QPcLqc9x9AQFrOZIkaFh/eAaRsxWw7/2RSAL5qaZ8lSYTSX4XBF?=
 =?us-ascii?Q?zHnRIHTUCCOo1k5hYHMit5FF56krb0GZXWSjNN/OgbzoUaz313QKDIzoCAhj?=
 =?us-ascii?Q?f98NP4UogJloMskBmMFVm1A2RWDEI6gMSmRo41z5TzvZHm7brXdkdq3kgv/x?=
 =?us-ascii?Q?Nr7UlkVGXMww/LzRdfj9IKNocfBXEoxnyAzR3mDlctrSkMIRVTxntOJrTy5E?=
 =?us-ascii?Q?xR3FCckYluGOwHXyWNGkLqefRt9R5CQqcTTMG2SvbyboH6g+jVsJkk8ZkXzB?=
 =?us-ascii?Q?b5Zh7udfdP3S7obklXMXGGl7Ni7guLOV3w7GzKYqaGXo0VVz1UiFoMOg79Bu?=
 =?us-ascii?Q?7uBtNdav6lR+VVXQROsK8pvdrtrcW/oVI0IzOKsegiruwG57Gjru/veHAz8n?=
 =?us-ascii?Q?f8g+IyFpnub4gFtMoUVACPXGGQGgt7R+om78LSE88xdotzfZk4F9mEyIaP0W?=
 =?us-ascii?Q?bO3+kdD1ttHd+evNT/tIDSfWVLz7Wgp1TF8c1iqcnIPNvedJhOgM6qx1UCzN?=
 =?us-ascii?Q?PqgjklOSohmtGdOZDLQNF9ETlAMWJL0F4t3pJU3ET/3MlOhk6XYA6QgFU5fE?=
 =?us-ascii?Q?y6dEFyMbuabAokxKDqFdPJw9oeuP58UoU4zSpfhYjwMrIeqi1XI/6Tprxjiy?=
 =?us-ascii?Q?2Z9uq8r6J1X/3yCsM7qe8y67QRvwwOpLduXlYVlf/CVj4dVm0Yod7voUwLjV?=
 =?us-ascii?Q?PeVivIDccNQH1RNqqQwwBFqSExGfZSI7poxyCUhVzOCoMs6c7O0tLLxxKy1f?=
 =?us-ascii?Q?E2z+fFCO0pEwA8wJmiA6F8YX10qMlROgpnZ0voZX/X0ueOIRBwNPVqV0h9Vs?=
 =?us-ascii?Q?IBi5c7Za0+JupGD7jGu8+MqyyZDQ9aGti+MFmXM21wYdUqW+bEpNMRMBAyK6?=
 =?us-ascii?Q?PLLbiMKL73iaGEtNoUwRh1UirJMpA9kylIBA02kLZh5vmRV+1UjDqpSNVuyC?=
 =?us-ascii?Q?OvpLD94QUdnAchk5CMQ9StgrBMias4oX8VV1hCnOdMfmfmeeBs2DqTMGNo+S?=
 =?us-ascii?Q?ZOpZPl93d3fJmKHOIaVs1a4xns7DHn7mNbTNl7HirNtl0BjafyYRjxRS7lgN?=
 =?us-ascii?Q?GcKwG8BW+/mtX1kY2qTWdlJ1CgFD6cD9fMuaeCBjxkFkVS2OkgDihOHAH6xh?=
 =?us-ascii?Q?+mcTlo9EnqWhT97Q2u4bOly2wNcbFO6RAn6vcs9q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c6z+SYIGKWKK7XBPQ2ysn3i5GHsOP0IfG2CbeF4vkoudAJWl/sQzgljDgde39ZSLiRLOsX6kgyKN2mRGp1E3UMhsXkwZF4JDobnFSz4JsWoKJtfsVpt5c5r0MEraSA62/fod3k5juGqOtpad+WoJd5skTTO8QRLG+UijU+Y0pWf5n1TUaeZkweMeny3/pGMEQAXz6e3J9jJFlX01SS16sayQ40LLi6vWiWhwiPLJsrGibSVa9pA73KkTgkmtfVfEyEt2XU7nckEGXZ+rML1zM4HRt6TYDpqlpbnQA03hkoS52WVEKm6gP3Wr8vKXOAe+8Aq3WPXoXdI7CKbOfQPKaH48+Tl9tEXYa2PW+9Rm1v4v8raRSsECRVfYDgw6Gl5dCPh7w5IE75rstEdCWWaCoXTGvwtZ8CiubyT6bErreG6zdeabkzBx4j7JrrZBwb+DLDPgaBg8OkXBB/UCE2Km8mwl/t4UKpBwoQGcaoVXKcxXcb78oonD+D+yK7cAfLqByTa6BkIsaKz2PRCRct0gCRWm2Fh5cNBzgQ+iLTHW77j7jhplscddXAfKlEe7DsvqE5C4lIjCu52L0QjCSFRWqgaxIbybzkuMjpxvaiKop6k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21565e9b-0373-42e1-cfef-08dce42f28dd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:43:58.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aP7iyJrByQnE0i3B7+RwllmCpDRyTbzvyb5dPhWQ+vHLkm8ayHmO9JErAdNn7CgrsBgWhjPl/MhAttsfvf4PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040031
X-Proofpoint-GUID: 49rWriyRXYpwpBeHOFDFXhberqA9uROu
X-Proofpoint-ORIG-GUID: 49rWriyRXYpwpBeHOFDFXhberqA9uROu

From: Eugene Loh <eugene.loh@oracle.com>

Commit ea592d60 ("proc: improve armouring against self-grabs") has no
tests, but it breaks test/unittest/usdt/tst.multitrace.sh.  The patch
makes the following change in libdtrace/dt_proc.c dt_proc_control():

        if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
                    dtp->dt_sysslice) > 0) ||
    -       ((tracer_pid != 0) &&
    -        (tracer_pid != getpid())) ||
    +       (tracer_pid == getpid()) ||
    -       (dpr->dpr_pid == getpid()))
    +       (tgid == getpid()))
                noninvasive = 2;

We change a
        (tracer_pid != getpid())
into a
        (tracer_pid == getpid())

Changing that == back into a != makes tst.multitrace.sh work again.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
index a052abbac..7c3eb2a24 100644
--- a/libdtrace/dt_proc.c
+++ b/libdtrace/dt_proc.c
@@ -954,7 +954,7 @@ dt_proc_control(void *arg)
 
 			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
 				    dtp->dt_sysslice) > 0) ||
-			    (tracer_pid == getpid()) ||
+			    (tracer_pid != getpid()) ||
 			    (tgid == getpid()))
 				noninvasive = 2;
 		}
-- 
2.43.5

