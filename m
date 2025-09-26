Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F79A202F70
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913596; cv=fail; b=pT7mJ+nXUfrCMidMKi4/uzq8Pq4jeSzKW0XQakbuYm9X3FDAWuZ34CD0XxErYV7JQtb4xjL5KDxpcYNTOwxdKOx3rnTYn+Blen84jPMnaBSPE06ROzJDNZasPMBbJ1K3Hjkx+peyIYShzA5LFUBoOZ9ktdaSnmsxU2ogCQhXPN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913596; c=relaxed/simple;
	bh=hLIeCo1ZRMpc2t03XLSoHkY9ZWw8oqqM+bBivlmVy+8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aOzDl+EpfSBkLCkZ+ic3cHMqEs4TATVx8b6vpLFUT1NA7sWV9esg0G0rG1vZQDUjH9tMGbGqUul0E3nAbXOS8f4LDfiLxLph4/vxpwCoq0eyVSKVBiDdoERmjwgKqCwAqn6b8eojUHIBrCahSGBXC/qzGPHA2GSu3uNnijbNcFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dv/laXiU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tEFWzsPh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dv/laXiU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tEFWzsPh"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINJru030854
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mMSbBXyQj8YFlLLZdm
	dWm36CXaYw5x0P4f4ljpKEs6U=; b=dv/laXiUyJvGzQy0K6cd4VSI32KNIDFjBg
	jZcupW+/HWljYPzyMZCLxnaFTkMYOaZMLuZrCOgzvwrnH9BSuEGAY0mHt+9sRoPb
	ZcFb/AzkLCkaM1ngZnAnPZt5yGP76/xrBlpMn0v4lvalGx3lUZgWjBrBcWRXf+hG
	nn5Nxt8500zSeiJF1AispvNiNeIfkZWTlzTN10OxyrvYuMmBtlCe4GdTeHTxnQYH
	c3A9PaUDL2kk/eoXFuMstrcYi5fkjLHOd5sVhaUAe64GT78u7p1btEvfO0rqFPaq
	oSxYOAHuXkzFlcy3Vjy3kGIM4x5MDsd6R0IPLTkItkrNrbw9olew==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dyv182v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIYDfM023318
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:31 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f94-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3sY2Sh9nIVOYjhRF2csPZ6BoFv5OzKzUQaw83RMDI94DxA/25vu2FmPsEsDgeNBCxuyKtM3J4lwoKy3qnFfT7PoWZzg7H7Dg9IhYdFxxb7WQeHrweRqzq+0QbM+mNrKDvEHsqnPI864pB7xO5O48zrKNsZivjJq+e5rdMAtqs+eI7fUCYQMGbFCcwqQ7TYEMPKW4Bs92ZObhy87S8yULmvs26QShoDjHYKQAhY7coJ+wLk2RjxIjm+f0ZZtrj8w5T+VLL6ZYXHsDBDCJZrTa2qduh1TWBu+mvAtdhmzoBuSpMTJ7k3YLFGRp893UsWzIeTvEK+OKr5bcL3iaWPi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMSbBXyQj8YFlLLZdmdWm36CXaYw5x0P4f4ljpKEs6U=;
 b=NrUwQdMXbVfF3cw6/429ol8cbULctVUmu8vM6KrOl4Q70FdEJhwWBxicj7vS0EklME6vUsw8QlaUSWjjtqez6Nwzs6/KJY0of5peaQI9LLqe6G0BLPycKegKpBPJY9ydx/cRBqJCDt2RieUwERa9NiqeQUvd/8IEy5Ulw82/heYkNQNXuDUcVb1Tuyanad5KVM1pYvG3WLvjRXpxW7YMjmQCxho5PQIHOFGFzVeXcTyOrpTm+Mlx11X1JL4KigqgwcTlfDZO5PqVmKhVF6gTiHURzzSs+bQ30XCRHuC62/E8STjQE8cSuLdCuncRsRasBk603PL4fCIttLCD/CGosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMSbBXyQj8YFlLLZdmdWm36CXaYw5x0P4f4ljpKEs6U=;
 b=tEFWzsPhE0N9BwGaLwcY7jUqREjsKalzx5BbAgTFWGW9HpdhUwDONh4TNJsjk7LPjd3q0g1Ubj8j7eeigCJ4Q0x9GZk1vZJE93NQSPiggrFT7mI0IBwLydKAMqAqZQm7sgWwvVdSc3TkjJTOF/IRkk7hYL2fM4HBw5b/5PXMBn0=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:26 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 18/20] doc: Add TCP provider documentation
Date: Fri, 26 Sep 2025 15:05:55 -0400
Message-Id: <20250926190557.8485-18-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: c25053f5-1031-45fd-af6b-08ddfd2fca91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z92zu9pZcg9+MdmTl9S1EikBROnWJWNarVHBhmM/QAl9FQP2YN0u4L/Ob9R3?=
 =?us-ascii?Q?ZG7rWoAY5gZkShKK6uqlRIMPbcGZZdtROJngTkxnhTs93fNfks5s/H57bEgp?=
 =?us-ascii?Q?Pe5tYfFGfImCtrqV6W8VjNu7vsZPm3Dw5yFpNUjMkK0b5sl87uKExDcOcHwR?=
 =?us-ascii?Q?R2JhJP9UQ+6lKGliiCaRs13+Du61AY9JMK4QKVP4KuGWLJQ+yN+svF53P7/F?=
 =?us-ascii?Q?sETwQhtk8wmbifN1+Wpm4pBxotubq6uQNR48rvqPJkHdUy++r0dsesmrl7V5?=
 =?us-ascii?Q?n+F39Bbup2ieCa8XzOvhEwBRlkndqnggLWPcovpnBI9g0qUK0lAGMr4pkvWo?=
 =?us-ascii?Q?sQYNjDo1I60APzippUTOGLTdQy+e9Rshm46ua6Nu+IcTsMovf9SeJWq9l3jK?=
 =?us-ascii?Q?rcKSoPan4U3sSm9ylRFdceLfshIB+9RdXRbo5xyU1kepxpAwgoP1LLqM9fAO?=
 =?us-ascii?Q?Po7/EwlswqVGTNZrAFcgjFc/TjNw94+og8DbNGSIRukkB3ytKcIHJghlOxMY?=
 =?us-ascii?Q?DX/tp1d6vCnhrHgY9axGC2its9BwNzxU9utI3in8mmp2VtNXs8ToDNx7+2Bb?=
 =?us-ascii?Q?9mzTLf/47Mf2ahougdUgKDK9lNJNraYEZbsxbLEzdsOs8MjjIAt4N42/wcu5?=
 =?us-ascii?Q?Y419diwMATfLGAZqcI1SRweWjEBW1xti4OYLYmDRODuagUuXCOlPoioD5q8K?=
 =?us-ascii?Q?0Gky35NleOdnVBx1PD6VunhFlzpwWoK7PE7uPiHmHzZeeJ1NuvKrVLb3tPP6?=
 =?us-ascii?Q?jzR+fwVxDdYcqrkEFmen4mPCKzw9fCKEc81hH0Sr9Uvzp6N+ng6byJ6CQYk0?=
 =?us-ascii?Q?wRG8Uln/hqCOh8VUOkpbQ24eXWl/y+k6/5cRyG18RZ8ab8eGiv8tXMOU0x3N?=
 =?us-ascii?Q?8xLFDjyyy5tEVxNjGFYDjRf91vYvwdLKfO0bPIxkUJB05zwfhUPqADufq7vF?=
 =?us-ascii?Q?KbmmTtWp7qNytXatlRcNgyVm5R7bcFL0+HIS8zW/EzwVRjoUeFaPilq5ZuPx?=
 =?us-ascii?Q?kvlUSsw+0gq1IQdRZCElOOZJs0SasXZkXkGzeSpp+DikcFOcEMEHgbDxCs4M?=
 =?us-ascii?Q?75FM28VTJBQGbBGF7PolvhH1rrfCAg1Pi+Xk1KI1gb4DB4sqJXIrmAagin4v?=
 =?us-ascii?Q?a+ez47Qf70WNkEKDgX+M/dNXM2qofoCWB4MJbEVMox93ERlzPqzGQQzxRVsW?=
 =?us-ascii?Q?iqNxRJ0sktYYcB81Ja2HVvpkFvOos9iQW1ry/r7PR1vWzrN4iu474guIX9R0?=
 =?us-ascii?Q?nqGnWK1lwOxj3LRJUV07i8dCfTBN8UgyoMUTlIj/RdraeSqscQo5E3ZlusSB?=
 =?us-ascii?Q?nZZytfhgyWpIsWHLDgGCYPqy0u5LG84pMLUI/XnFmLCrdqhq8UrXTxmVO7ga?=
 =?us-ascii?Q?RYKqMMB286DAPpvnXqtRoHJpB8ObQPDu3BeUAFh1Kml60XhTRFkvTkjHJuIl?=
 =?us-ascii?Q?3VdnQIU6M4iSqcIuLF+GLeoJtqcOnFKO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XIy/OBKj7YD+hdNq+SIgqx2KqAwBDnnSMhK+rJaRmVQFYXYTyb/NNLj5xUyW?=
 =?us-ascii?Q?5wM7YQK5JOAuyYRAoj0d0lcVcXQq3ML5wAhZr47kn0UTllBKiHDPgGKw6+tO?=
 =?us-ascii?Q?AeZXXBQq0O1dH+ssFuOzbzrDdZGSG0IzjPA0iCbFmqkbLTsiJaGsRkH2cdrY?=
 =?us-ascii?Q?LT/98nDJ/cVt4Mp0ASYt3OPBqYEccleim4Egq8xcAPVEzYYsd1ulbGDrhi/p?=
 =?us-ascii?Q?F07zirOlxAis04/qp9qDVfGTddQD/Hy8dZzh/LvE7vn638gRKXyJNtywPypV?=
 =?us-ascii?Q?LYDDb8xlrOOOKAL+d1UpmAN2ilVC8JWCRpjY4uw41whkMHu0y8ChuX8ducAr?=
 =?us-ascii?Q?auYjcAcGCf/l6RqmpPTNqVe9XsT/LUF4BUFDAcVpR6AQtBBfqs6ETSu+atMy?=
 =?us-ascii?Q?4QkOh8nefEj3rCcbQEWfGGbczVx5ZdJHagGOK89khGqS1VFKoS+z9W74gj2F?=
 =?us-ascii?Q?PDTiY2czpWUHq7EwixrpaCKGf5IlKLv6GHGw31Qvny/9aZuxlUMA3ippFTYa?=
 =?us-ascii?Q?7A6PTekh1tNujqr7tJmOimS9Yv0o0H+cDMM9v7Qm3cwx/l2GwIZo4AwANlhD?=
 =?us-ascii?Q?7w1hZwy2zKun1k/JGju8am30kRdwyQguZRYXTHl1nBanWGOXUdgV2CgpmfZM?=
 =?us-ascii?Q?crWXeaUTdYeHqGxKJdR1UIskuBIoDrIiXAjXtG5dGMuZnkwkL27vh574cjZh?=
 =?us-ascii?Q?lisjwaXkneK/uXU75gFZDpEMWD0KwShopwot2pHqbYH3fCobged2Y1l4YZZC?=
 =?us-ascii?Q?FQhfdcvPOtPl7R5NDmAGh4OjcRAAyaPEhO6IcOP5BeQoy5PPN3zelzohL8dU?=
 =?us-ascii?Q?SUpF6OFJMkUKQ3eUIHWJismyOwcGEG1mMyhFPGNjbjo4dxBi20tQSAJdlW5r?=
 =?us-ascii?Q?0DG0HoKB8zNrPQTfW1egcrj8rcDzTCBHnR1WuafzZRc9TUekzLBXmLT8ziqh?=
 =?us-ascii?Q?VPAeZcbxq4J1UqKQXtQi0uhPn5oBF3zx9hf1Vefc0KCDgnkeEHrqohgAael+?=
 =?us-ascii?Q?se3SkLAeuHDylr35mBZ4c925DnWDMoFzyefjDhsWBVvM7LKzZJsAewYkEEow?=
 =?us-ascii?Q?x7/jvxNzvDil28I2FeGgME5OUFIKnE4OaWmhzDEbxTO+L0y3ZNlxbTDb54+G?=
 =?us-ascii?Q?qTZZxg4L77nIQ6AdMPffTPYYKm+CsiezvbCuiUr4wHeJ9O66+GoTAUs/W3Sw?=
 =?us-ascii?Q?0SPjIw82KsQlGk4ax3WA/cV3O7F/CZa2CuJuvIC/5l7sjtkUXaxyDzwdYuDv?=
 =?us-ascii?Q?gq5cP8naF1MtFNfzpFltd1OUGKwi9DFtNMSUv31zYmMAQnhT7RFgJg9ywdax?=
 =?us-ascii?Q?EeJH+75PIbb3Ts2WY0quDkm8dtgrXRULdT4S6Yd/P/xPN+JhHAnIlxyIpqX3?=
 =?us-ascii?Q?Wsnujar1Ctwo7AHR/1SUfiPXX+pHtsCLkUiPgWCTTtNBsj/iixt2zCjSWNJ1?=
 =?us-ascii?Q?MAmRAdqfNyZtZNadUA5oe8NUe9WuhY3KB1SZtzDOWgpe8IpMx3wcp50U7zE8?=
 =?us-ascii?Q?0iyTLzIT3VgSS4cdJgARc2b5leEIQcszdsZrCTzZLf37E7NwL4e3XrJiW2wE?=
 =?us-ascii?Q?iuDMZjiXepxP7z7XdGCEVw8PbIeZsfl93IyLxRAY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iq8QHHxo5arKFMdqsXeXBcXYTVNGiKH+cRESWpyi2FZqyBmCLILjVocnFoa5oYJbsF3nlWYGJKxY14XIUcFCEOu3H5Sk61VjV21U6Z+o7K50QkJdzSyH+sVkIcMkxAXWAxBVTW38zO2iZvtPTpeyHQl6t5RSeNpFROR3AjDiAFGXp43IiVIvjLG4RlupLDCfNO2FhludX0MW5HLl51K2yUDCU+/vYVbJNVBKMlBbbuCBEFpdWmSkwqUX0sGefLOoG0Ho95GrSnlhRdKoZTdWVHtdTMuULJKMTdXfTS/Y8XQUN4LnxyBWFHFQPYuqQkd5QaDGgpPEAiZElcuW8Cap+HJ6M2V6AdAnWxQowomBj7639us9UOu6zVYURLXHTSiRQluQtv/D3OL5PTdf4p/OgHsNd4XCsu1AFVO6rwMcP4++Htca2yeG2sdrl7nb9/pxwCwSUWo+0+Da3hmLit50fI/+UQiIa6yKINMU1R1J0Fo/wJLK3ACDj34md7rffdORSUNQo0UhQ+zr8ZOft/Gl/ZEXmYandfjqdsGvZrpdoI9yYpAevD+U+c9lroDL9UFPgf8030sM0jSIFG9NPj5zJ6HgTy0okZpkGu9qQG9bbZw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25053f5-1031-45fd-af6b-08ddfd2fca91
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:26.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJ8JkQFwuYpSvLiPBZ94mLm/lJvjlSbz/kPwdAw9AwyH8fFQVJ7HJmpCnGIYdvHwWTRM/o2ZtYHfT8GUSu6lyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: g1Rd1XKNXBH_AQrKZfcCRlWLTN8_ppBC
X-Authority-Analysis: v=2.4 cv=PdDyRyhd c=1 sm=1 tr=0 ts=68d6e438 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1jyxHu2eCGP2-q1wrTwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2NCBTYWx0ZWRfX/UjXWgGbE9+K
 pnl6svNfwkOMw+vyjs/uHxfqfaUrH4j/MT9Iq2YDbonsgyQpD8cr1ZaEtSR4doGeAyQpaHweNm6
 e5pDhbg+DDEdYlS6MyOH12hsFHAjDoEzRdqxEEVAtAu+hACzWQgafjG3Z5Jap/YjvQMSprAglau
 WMzKX4lHePE8UVhkXe7DPL+4kFdsAWDrrGATrrEovbpH1v7khanLcOnY9fR4O6c2if5Sv2AP2kM
 FNwvLRb/FJ1fnrYlXv5zq7Xmu8iQR0R/fPcAu40fvfnVrOvVMaUYU+gtPximw9zlBE4fF8z0Iea
 A4sP3g2JF0wTjMUJbEweBT1nB/5bfzQISDoEvIDeBNrfKpXn6RswzPHC+zd/rTtXuQfr9X+Jg3M
 G77aN3CZpF2kEm45yUe1tS8qMm05CA==
X-Proofpoint-GUID: g1Rd1XKNXBH_AQrKZfcCRlWLTN8_ppBC

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |   7 +
 doc/userguide/reference/dtrace_providers.md   |   2 +
 .../reference/dtrace_providers_tcp.md         | 128 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_tcp.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 18b9bcd68..d47df094b 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -259,6 +259,13 @@
         -   [syscall Probes](reference/dtrace_providers_syscall.md#syscall-probes)
         -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#syscall-probe-arguments)
         -   [syscall Stability](reference/dtrace_providers_syscall.md#syscall-stability)
+    -   [TCP Provider](reference/dtrace_providers_tcp.md)
+        -   [tcp Probes](reference/dtrace_providers_tcp.md#tcp-probes)
+        -   [tcp Probe Arguments](reference/dtrace_providers_tcp.md#tcp-probe-arguments)
+            -   [tcpinfo\_t](reference/dtrace_providers_tcp.md#tcpinfo_t)
+            -   [tcpsinfo\_t](reference/dtrace_providers_tcp.md#tcpsinfo_t)
+            -   [tcplsinfo\_t](reference/dtrace_providers_tcp.md#tcplsinfo_t)
+        -   [tcp Stability](reference/dtrace_providers_tcp.md#tcp-stability)
     -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
         -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#defining-usdt-providers-and-probes)
         -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#adding-usdt-probes-to-application-code)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 54a018d5c..029f62c54 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -29,5 +29,7 @@ The `sched` provider makes available probes related to CPU scheduling.
 The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
 -   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
+-   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
+The `tcp` provider makes available probe at different phases of TCP processing.
 -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
diff --git a/doc/userguide/reference/dtrace_providers_tcp.md b/doc/userguide/reference/dtrace_providers_tcp.md
new file mode 100644
index 000000000..9f6e4928c
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_tcp.md
@@ -0,0 +1,128 @@
+
+# TCP Provider
+
+The `tcp` provider makes available probes that mark different
+phases of tcp processing.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## tcp Probes
+
+`tcp` provides a probe for each of TCP accept (established or refused), connect
+(request, established, refused), send, receive, and state-change:
+
+- `accept-established`
+- `accept-refused`
+- `connect-request`
+- `connect-established`
+- `connect-refused`
+- `send`
+- `receive`
+- `state-change`
+
+The module name is always `vmlinux` and the function name is empty.
+
+## tcp Probe Arguments
+
+The following table lists the argument types for `tcp` probes.
+
+| probe                 | `args[0]`     | `args[1]`    | `args[2]`    | `args[3]`      | `args[4]`     | `args[5]`       |
+| :---                  | :---          | :---         | :---         | :---           | :---          | :---            |
+| `accept-established`  | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `accept-refused`      | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `connect-request`     | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `connect-established` | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `connect-refused`     | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `send`                | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `receive`             | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `state-change`        | `void`        | `csinfo_t *` | `void`       | `tcpsinfo_t *` | `void`        | `tcplsinfo_t *` |
+
+The `pktinfo_t`, `csinfo_t`, and `ipinfo_t` structures are described in [IP Provider](dtrace_providers_ip.md).
+
+### tcpinfo\_t
+
+The `tcpinfo_t` structure contains TCP header fields.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
+The definition of `tcpinfo_t` is as follows:
+
+```nocopybutton
+typedef struct tcpinfo {
+        uint16_t tcp_sport;      /* source port */
+        uint16_t tcp_dport;      /* destination port */
+        uint32_t tcp_seq;        /* sequence number */
+        uint32_t tcp_ack;        /* acknowledgment number */
+        uint8_t tcp_offset;      /* data offset, in bytes */
+        uint8_t tcp_flags;       /* flags */
+        uint16_t tcp_window;     /* window size */
+        uint16_t tcp_checksum;   /* checksum */
+        uint16_t tcp_urgent;     /* urgent data pointer */
+        uintptr_t tcp_hdr;       /* raw TCP header */
+} tcpinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `tcpinfo_t` from a `struct tcphdr *`.
+
+### tcpsinfo\_t
+
+The `tcpsinfo_t` structure contains stable TCP details from tcp_t.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
+The definition of `tcpsinfo_t` is as follows:
+
+```nocopybutton
+typedef struct tcpsinfo {
+        uintptr_t tcps_addr;
+        int tcps_local;              /* is delivered locally, boolean */
+        uint16_t tcps_lport;         /* local port */
+        uint16_t tcps_rport;         /* remote port */
+        string tcps_laddr;           /* local address, as a string */
+        string tcps_raddr;           /* remote address, as a string */
+        int tcps_state;              /* TCP state */
+        uint32_t tcps_iss;           /* Initial sequence # sent */
+        uint32_t tcps_suna;          /* sequence # sent but unacked */
+        uint32_t tcps_snxt;          /* next sequence # to send */
+        uint32_t tcps_rnxt;          /* next sequence # expected */
+        uint32_t tcps_swnd;          /* send window size */
+        int32_t tcps_snd_ws;         /* send window scaling */
+        uint32_t tcps_rwnd;          /* receive window size */
+        int32_t tcps_rcv_ws;         /* receive window scaling */
+        uint32_t tcps_cwnd;          /* congestion window */
+        uint32_t tcps_cwnd_ssthresh; /* threshold for congestion avoidance */
+        uint32_t tcps_sack_snxt;     /* next SACK seq # for retransmission */
+        uint32_t tcps_rto;           /* round-trip timeout, msec */
+        uint32_t tcps_mss;           /* max segment size */
+        int tcps_retransmit;         /* retransmit send event, boolean */
+        uint32_t tcps_rtt;           /* smoothed avg round-trip time, msec */
+        uint32_t tcps_rtt_sd;        /* standard deviation of RTT */
+        uint32_t tcps_irs;           /* Initial recv sequence # */
+} tcpsinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `tcpsinfo_t` from a `struct tcp_sock *`.
+
+### tcplsinfo\_t
+
+The `tcplsinfo_t` structure has the old tcp state for state changes.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
+The definition of `tcplsinfo_t` is as follows:
+
+```nocopybutton
+typedef struct tcplsinfo {
+        int tcps_state;        /* previous TCP state */
+} tcplsinfo_t;
+```
+
+## tcp Stability
+
+The `tcp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
-- 
2.47.3

