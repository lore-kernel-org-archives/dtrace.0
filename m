Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543C38656B
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202911; cv=fail; b=lRQM184gTxvu3QuUo0ZoRfcqWToQsWprCkaz06JDxHhu1Id1T9qTGDfmEWoEf1sReWkHkU3JCyco1Z1Vh9j51EJH8CjslPnEzP/bxB8v+Pi7JbUsf4FzZUjkG3RtgmGyxAfl6nni0IdLuIXZDiv2C8OMrhfJxsEZL2YakaSFnvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202911; c=relaxed/simple;
	bh=cVnvE1dV82WoYKqpHJKX3HQjGrlhifWaarUg9N6WR0I=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=CYgdIePO3TpTLcXQzJaUu57PKVUTbFP0SEVnkijZX39biQieD8SqbpMZzNpIZij0Lf1Dsq3X0E2KhhTllMsMdf/i57wprsHoxctaAxNlJMXyABxy7Hds3/hzhQu3kYrEBwk9Cadyay4j4g9XjOYmKzN/OV5ueNNF7Kat4xugNzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K6gbWd5Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r7+jcp8o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K6gbWd5Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r7+jcp8o"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EEsvNp625888
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wwaUkOScGoFCFQ45uL
	ikGBNiWNswAv+wRsfbd18L7cA=; b=K6gbWd5Q+Dlg6yQWaWmIX+Y3IkBMgennhO
	tY1FGFj/4ZN6bE6gvgB/99WQNIJlAdzrMwlEaw9Yy050XjFGHoh7QHgD7AiDRUTz
	DEg0k4VfETEIYC8NpNEd81xkoTpPWjX2SUDYkeQHLPKbS3GcIjHn19dmD3h/Coyo
	vHmw2Aq3vV4VLvNXgq8v6NUGFlfE4LYd2yTl7uvL7R790orcUo6750zoazyQ2z03
	XBAuBYl5fMzSdpCCSKlIlgjvk97NZJt/sM8B30xUUWkxj/re39mOuFQiq3n71Itj
	TMW5LNKvBUbFPZvzJ0roxGBraEcgL0cuDy3ytce++oRPbfOvoEMQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh87h3n6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:41:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELdMn9019589
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:41:48 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh9jptrrd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:41:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXW+BtIpEvtYgRGCOX8cgtA66zsUk5l/ZCNsX5lX+RbDHHxzxm3BMcJnhbHvxF7+i7rB88WUjWMH6zxta4TYdNF4uogyU75rEax82xeCIQxoUMe2LnPi0ovLEDULfL8ARQuiKIl4fG9fPJ2iok4f4dI1DpiY4I5tTgCreMA/N4cY2VU+JTaU2szRd4k/dPHB1NIujJm7okTUS2SmPnWB0gYxLc9Ocm3JLAjyttWk/Ik2KtCPp0q/auByFS/VergY8QpoeqCVYakE9o1D1BQipTs+RyQNbKmhF7vxTS5jPy7TpNbNGVK9CNIU5GuF0I32Vc6uYPu8fU7cMJyE1IZ39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwaUkOScGoFCFQ45uLikGBNiWNswAv+wRsfbd18L7cA=;
 b=tZ/58EvDzZmPq+7847XLPxmHTdAI3DiosfhsOFcIs3TBz2GPR0fOBUq0NEw164zAeT6diCAZPMZV0JoaCd0QL14T+ibrwLGyikts4dkqyIF/zEMuAkfSqwXfG0xKTQZSfzc/mqR9UJLNjuOmMULiPieJDWWWFOcbrEnFbxc4uG9mG1NRftkr3tzjv+lYaI14j9Fs9eZdoAMH5upQWVQ9d8JJzoIeZHHrY/fNXYfNknIH4CWXoVIEU3tSiVfVdBcP7+uMTm+1DG0YADpu68a0uXjQZ1OiV3zPlGjobBQ8Y4ga2L2xY3dwto4L2KaE7mEl39MH2jIT8JpOzBdGpRicFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwaUkOScGoFCFQ45uLikGBNiWNswAv+wRsfbd18L7cA=;
 b=r7+jcp8oveZWHXgGfkknHirJ0Pntjwv7Yk7O2Q98bgeAonH5RMiAJgFWs4CmZbyE7jLQrdshO3ryRzWfEWy6jpjs8R0b5SPR50vhF8CZ4R3m8flVJzoL+I1K1GtSWwvV1lZTxpfcOIJW0/f4p7zIqkmq0YJJXyR7S1/uG9tfXvU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SAWPR10MB997791.namprd10.prod.outlook.com
 (2603:10b6:806:4e2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:41:46 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:41:46 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 4/6] test: Remove unnecessary
 "destructive" pragma
In-Reply-To: <20260331010224.16165-4-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 30 Mar 2026 21:02:22 -0400")
References: <20260331010224.16165-1-eugene.loh@oracle.com>
	<20260331010224.16165-4-eugene.loh@oracle.com>
Emacs: a Lisp interpreter masquerading as ... a Lisp interpreter!
Date: Tue, 14 Apr 2026 22:41:43 +0100
Message-ID: <87wly91ap4.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: PR3P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::26) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SAWPR10MB997791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5dd701-eeef-49c1-ebbd-08de9a6ea036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A2TsQsheLoZ+wrguM8GTqqmKH5Wjx1s59cY0Or4fzjvY6FvRWmZdJ4ysSBS5fYU8eA2S2fk/ue6MKPKstk3tXx18/KGGaKDh375HRkIkvIzttZqeV19GjxMBqQb1lQcGzE9jAXRQ0MP6J7j02PRFJPebPO4rpFD6K/AgWuDZcvgTNLLi31FOCV9Kw6zHxV0t2xDjKu9ke/lZzLK8abB8Tsf8Noaw20VoaU9JFF+f9IW1BVbxzqBIa6Oh0QVMBCBWlu7q8JMEB5vpzFeuzO0UQWJeJJMBBohWvrxJKwg2ccXzRYY8JvGEj5qFI0FAOHhggZZrlxUdBhELsaDCgziQvfJOe95SiwfEI4Crp7x0jnLSafTsjzi+Y5DRbdR1s6Jm9hwnLOCpZAoXRcFAJKqCOujrqPBEEPsskcFWaG0PJm1IHgvO0gGjbktGJjgQJxP/W3pVue3spig4jApJEOhTo/jULCNuFoEh5O8z20D4Ket7YBpqhhBCZP+2xU8S64ofgXjJrumz8gQaQfRtoHJEtaNuoc4BXCcCDlQubxXZYmVzWOURe5amec0oVMwVQxPQc6SqxdbcIJDVvVIt1k13hjoZUpPzohWOiB5auVlqZisNGao/DJZUqWofaAGoiqvY4+fvol8XcR16GW/Txa3vNwFQzMb0kMU7objF1wLl2y4JElsKV50nWWUMrjXoqiCJ+/ZRzimTOiFPEG+rVoWVFDSAPiZhtzGACiiD19OeCTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jsLnD7AL2FCadG1WnLZLg7DI/T1GAn2ggvX6bv8SiRzt9oF4b3nuBC0ulA8M?=
 =?us-ascii?Q?3YawPzrG8HcLX9O6WSloPjlfBxVKQMHmEzl4IuO4GZxPZT0kFazt89YbDqwJ?=
 =?us-ascii?Q?p2vn/DZBc5e2XqlxcCj+jp98WdEnpA1nVgFqBSHHKKfaSNmBqIQs09NO0eiO?=
 =?us-ascii?Q?ftS0Xx/N1SJSOae4f8KHMBDXDbXtQhxyjHZaWHVqgJ/GLPr43evnrbmD0UTb?=
 =?us-ascii?Q?yZBakscRMvgIoD8GKAEGxqXHGg47MfeBdH8R2VXEaXotQ8vG6d4HP3YKOnIs?=
 =?us-ascii?Q?gGHP18Pnj6iHA/JFpw+DiNcZRqvFrXN5aUuHTWVxbv00XZLWg2tI0n08SGYS?=
 =?us-ascii?Q?LgMQWQ9lwitwU1wEIvhJHtFGTqSZ5N9q8ju7JrwwrvHCScguFqPKQylPbLBv?=
 =?us-ascii?Q?116gJR7fRSIxPu4bt+NxgxJpePhAtKmges/DbMz2kppzVORJF+x8kS/OBVmU?=
 =?us-ascii?Q?T6yf3vWul2gtX0FQbrR5CeZcoqC72T/owtOKHAlibfQHkHnhIdKWo4Znc0v4?=
 =?us-ascii?Q?dj/cygMktm0Wk3cIXNlULgE4zJssrryiVq5zAso2t9qFHeJdnJPOPTXKYB65?=
 =?us-ascii?Q?D+OxceABJC79/iLtXT35n4COFm4NDwlVvVWIT1nrAFkqgm1QKOIcf1wnMpZ7?=
 =?us-ascii?Q?Jl0s2SjKLhRBp9CwuJZWW7irSr+ezlTP2AkpqYcTcLE5rs/BMXiniOWzqXtp?=
 =?us-ascii?Q?joq5HSOWAkF0JOeloJPBwuQOC/ut8WR2KzS8htCIoomg5xppwXF2mbobuKjB?=
 =?us-ascii?Q?gYDjde5D5d1ybGzBDH/QSsKE32of8Ij7He3oNNRtahk5BoSu7J5XB+g0iGL+?=
 =?us-ascii?Q?W3pdDcTT0/zv5/VaeKUfrSNvOgFKF58I/pJO3uJPwyMA84aV87tTWOkG8wf3?=
 =?us-ascii?Q?lA7U1YMqeNu8Eacko9wHNUCo9ndX/MEj6Io+n1A1tHWPxql5CdPOH/mWEAXL?=
 =?us-ascii?Q?ePUy09D3p4IkZesK50/k9E2aaHpGl4wJFOwkJ20T6X19uFB75O2jvhfUlj+I?=
 =?us-ascii?Q?0SObwjpmRLstm7mafknCYPYEOFbx6kzOsPtixNN70ZUmkeP8Kjfo/zuDqIfh?=
 =?us-ascii?Q?NjTtoXzRsyRvQq6aLd/ZdzIQIUaxxGwqz5VuI2VuU5o1SUt9gMvycMjJ5v7Q?=
 =?us-ascii?Q?7HhOWI0sKBsqI74MHsFVBxR/cnXVIwmxA7i1voQ8TjdZxL3eHIluM9lpotoi?=
 =?us-ascii?Q?pDfkxGYE/P3Zp/yMzJbhoYBzTNSY2hm/LH+K1RvHhIbNmeJ8SiP2hSVYOkhI?=
 =?us-ascii?Q?rzSzdKvp62vwpRT55LiZ7Av+ZSIVzOi3bTzROsBFclprA9w5tuusXwuiheEg?=
 =?us-ascii?Q?846KCEQCJFz7QhHj5k0vCTzR13BYEsYHfq7pufXGi30DG3zYagL5aVxWiYon?=
 =?us-ascii?Q?DyauWfPQ426VekRii5IVF2pn7TyyFXyLsXVsJIwrcbWF/HsBhBc2CQuwqn5g?=
 =?us-ascii?Q?JL1UCPYgnEQPnjIJrbEHHZgCmg+vqBe1nDPopnGdZboDtj0llkutiEioiobj?=
 =?us-ascii?Q?+z03oyeqFYHm6Pb3KXeBqPd4bm62fL5t3Z4dWpwhJNYGkXF2YjA7t5dnQYJj?=
 =?us-ascii?Q?3EqrFn0KUXiqxhh6zBviTh7hthFfGHIxnzGkJbkOKxqcxpaP60cK9XrCRsvk?=
 =?us-ascii?Q?DZ/fieICAK2+tJ8bC5c8YtD+JsBf4V3POvQCZADbdIpv7opcmhSGl5PqPaF1?=
 =?us-ascii?Q?36q9kBm69bGxDV01EaAuDLRlMsHbQayHrgYZUOEl4gWfgCUcLp3jYCC+z6yI?=
 =?us-ascii?Q?CYRjM/vAaQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	pFrbVwjI3nMrgWfwT08a8MZfIN4HcUkUayWZft9XqBYuVNOAR1dxQMBDP7bdLofZLIK7ro3f+inbN44l3spr+SmzwM7v5+YoXVVTcj0oD6T+CVwL90HxLfIE02vQjm4LfxEcBDRnDd7N7lhj6JMvNOeffin9HCBUlxfZqTt9GZubwLQ1axXkXNMZxOD3eaHaZP2iSaJQSnueNiZmmQio017cqFZvHfzc4Q3suhzXLx3Y0ub6WylKed0Mbh3Q34h6qaYSxRSHaF1z2L9bXWH+TT4FowMJE29IW8MS6o3uSNL5oSOhDUMxynARdj50Uswqqr/67d4u09WVxS/5mu3Ayw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1F+87p26NFohGl/f5jekrfLhL2Iuu3SYnjjbdvtgIN95vjVeKi7osP8Yphlqyhv7qheF9H+gsrRAJ8qL17LmtRcyUuuPMYOwhSWuZJJfA8MqgpCZ74bBMVG+OLIqknDFBEaSGoL/plMETxVIGoN0KazkY0dMbp1u1sX+0ca5CjhVtwvcqYBzN4h8Y7ad31u6U141HyieKoyFoJqfEYgGBB12sjag2Sd2uSkw/DRz9vJvo3f5xiN512Rsb8m8QukhHP4O6Dia8hSKgN7k2S0+UOtKqoITvh4C+ZOmfd9jLHn153e8JrSYyBPtlb0t0krfYCcwanxnRYA5PFHkNf0FNiLv3TUDtEZ1xVrTdWzLrTny9Lrh+pN+sPVWj7S/w6NI1acK6VfGU0E/VIO2pNgE99UEZCftxhUARpDVR5F+ZTSx84HiF0e/7fk7H9umN1184S52tm5AzhKeEzNpCN4ftYSMJyddxPP9TBO7yg64OX/sRs3VDDGpXrIDQMfXBtOhhG3CEYcoevux8lT0NecCepoaJECdZN6TzqafxqQSLGgJ+y+Ig8puvfh8uDc3x8i+xwpVkATgxHWCPLKNY8DfFSwWZLeFu9HaiR5O6BKGwog=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5dd701-eeef-49c1-ebbd-08de9a6ea036
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:41:45.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flP3FYXKQRSfKAkHhngEUz2eIqNKnIfkfVAjgwle2UAyxMiUSIJ9NfOWly7TKwGaFtrHTQzy0dNOKRuXuF2SPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140202
X-Authority-Analysis: v=2.4 cv=eJUjSnp1 c=1 sm=1 tr=0 ts=69deb49d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9
 a=bQS9OzEy0soA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMiBTYWx0ZWRfX0zTU2UMhFZsi
 mle9vlu73rq0oiUZy5TLzbNXwJzyWv272/O44PlgnwiQB3ABIIwBkvuz/oTNRPivqyT6vo5QeOt
 aUV+CVdED8OxXZZ/YraBxEHDj9Ts827PZda9DsbcZHQrlaFoA600z0+QZlopS2F/+f/duWPycYx
 dq84m/8uONotNXWjBUMy92vS7gqBB1x0pEwTFJ/ktu9Umkq+sBPRQV+wfj7bLynRu4wUmHiT37c
 5YeVd1Q2fsSFd9hZCoboHmkdekT7PkRvr5ONRjGVYy/S4FTJWFxSEbJFjIM0SzC98NpSotXl+ZO
 OfLtXmsP3tv4VKDek6iUaf0c4nBLpqLSUPQ4ndevtw/kRaVEbI4DWXZxXTi1uQWJn/DwIlPMimH
 H2FoqnxJJRLKMjE9sW2yBr5x32InNLmnVkpc3zh1r+zWCkw5dqInxvsdD4exZrIwh6ouA640kVj
 CHrvkHTbQk3xF/PIpiA==
X-Proofpoint-ORIG-GUID: _Kn9tHpXDlbhupRdB5b54W-Nc58WqnRj
X-Proofpoint-GUID: _Kn9tHpXDlbhupRdB5b54W-Nc58WqnRj

On 31 Mar 2026, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
