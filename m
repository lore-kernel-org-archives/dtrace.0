Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6375A14E2CB
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803283; cv=fail; b=R8k65j+jcwiRHw80Kp0y2zDgu8/SIPm/cMahgualEFU3jVVHsoqJ2pyFUB3HjhD4qttRx35woE0iNRMXLFw1hoR6OyL0mKZnwzmphqwcmN38/QVKPr9nS+y97LXwo2WIXT23OlqPZ3RNtxwY5uqr2Cf8BuRfhNXAsuqObRwZDB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803283; c=relaxed/simple;
	bh=8VHwhkAlh4fryW8+p4dKKm31BNrG6KccdCYxjkjz0tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ECrREZkyzxiSPK9qVbvvp/uJzQ3slymGNvawngGZ4MYB1kTBkrN8/1gm0NbSn136TbyGmdfcK+Nh2JdXpwSLkWW+W65tucvizRAJKEtkCSEWHM2a6WJ5Ge0m2h/aE3IPDbmyByTebQio4Wwm+oU6qtvlrcTutfEQVsaU7Fp9gsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fpqBv9P3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Reo6oUOi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fpqBv9P3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Reo6oUOi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1tOw0017952
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=plcnCrQ/cH4jT00rDOuN/wwsdZp5rF1s4OC/6VfITK0=; b=
	fpqBv9P38W8sq7QqsDxSzYH3dbA4xBM4uqxVBlAwxSYp53IuUsmGn+EdQCc+zKJh
	q1+QOeKE1C1snAnwvrsFsdAnaD75jbQPaIrtBAwjsx3bhTU/mWkCw2DvUFawDZSs
	E9NQrb0hOYSpq7ozTeyQ+2e3XJawcYKgzcL4efXp3+1Zu2reyD4SRzB9hYn8UHkg
	Fl0v0KgkEABEyfJMYicA6mIH+QOyHb6iVt9ISCjesu2IPJAtkRqG2ZVlVGXUOHlo
	fGS4mCbOy1Dox2VZ2FmAfhSrEE2Wq1I0Das+t69EEe3RbWj4bvSc5qsEkZdbT1h8
	8B7UvJk98ssnQMNf0k/6gA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuj9j988c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:21:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45JCZP4w034830
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:21:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ys1d9j8eg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 13:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvxXy+eqXnm3lTSwhery7Z3lbnVCCV+nS7CRUj4DZFHAxOgcOo9FKTXcXGYMo0vRsuHUoOEV5XKn8Zm2pJngg4de5INDYwy6srAGYLI3fYgQ+/qnAtxlUhXnlL7Rd9qbcotFkWsrxMLUsFeMRd8J6W35JSamJjOuhnotxhB/iZlzs0BO0+Mi6WTQMvgsKj8eerA7enehbJ/28hPgxbMH05l6RaR2N68oL/PQSDnBInUp8X78Ll81bx4ftLkj1VAAfk5PxuooFAXwgsNFvDCyDpXgvWBmByM/LYthYnoJvhjOlf8CieOt2rYUmBbXurjDOMyqpRqvykm9chWcK19M8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plcnCrQ/cH4jT00rDOuN/wwsdZp5rF1s4OC/6VfITK0=;
 b=g2j96sFWUMhfqsZ+VgNQ00zemwyN/ESHSQbSqO8zqjPv//um9X27rRZEMRBPI1dVezfW1s13rt+R1W1LQNH/A/CB4JkUkHcmKZY8ugaXb0x/ndLaVAHgNNM0pfpakJjAZho1dIdNUot1mXYnbXO0aKqbe5+/xODia5dYjt+xtovVicr2lNi/B/2H2jwIZzjhw2rKcuDGxZunxNYvGFA1XxF1mPaZX0VLHdW3r39u3ZObd0ZddyozZnq7DLLtqRM/37ZcBRe2njSyBLasPNHnNRkRNGsBtIywc0dKQ7M7quhwa8hvGXQMgfmTmldBqlnTUmh8nbkT+DvITHLoukTifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plcnCrQ/cH4jT00rDOuN/wwsdZp5rF1s4OC/6VfITK0=;
 b=Reo6oUOiwXxErjmWljcMk7CY481Pvgtx3THjIs8kR0Xyux1FNHM/BZLFI5VxnEa7z0LrlJD2s6ELdGYM7rc42M3d1JzG9vCApJ6rCf7aAfIcYWAKY8DGflIX9ZHgp84hYNpd6X7AqfBZfkHbfhlzlF8Cbo0+hdH5upOXbuLVM0Y=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by BLAPR10MB5074.namprd10.prod.outlook.com (2603:10b6:208:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 13:21:15 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 13:21:15 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v3] translators: support 6.10
Date: Wed, 19 Jun 2024 14:21:09 +0100
Message-ID: <20240619132109.5566-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240607184155.316904-1-nick.alcock@oracle.com>
References: <20240607184155.316904-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|BLAPR10MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: c7836e58-2e74-49f3-3978-08dc9062b228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iSAJBBnlg2IPoB9QkEVKWpp4DcudYvjNMqKdMQr272+rotbqah1s0kdpENos?=
 =?us-ascii?Q?keMtgP46kCEwjd/z8XTLz9ODDcgmbaknYog6QZIynDewB1PhmCjBh4IjXUkB?=
 =?us-ascii?Q?BQ+xTu+a1MliYwl+Nv4hBB9kSAkhupApvu8yQdjmzWBp21AJLw1qRjIygx/i?=
 =?us-ascii?Q?2Cn1DhpQbJg3GUtPSfkPzwTTVeehlmBj+LkafwX6+eqACziDfGK/4+2wUb8Y?=
 =?us-ascii?Q?w1wjSF9iZiwBxJOpoUkVNmefA7N3kV98Y3QSLO2A897VThHGsSQ22Q4bi5DE?=
 =?us-ascii?Q?v1rU9WyH5xsF94IvkCEJhMtY8ZE6s7bWcD0Phlmt2XpCUjLw8YxDzA1pqrL4?=
 =?us-ascii?Q?nHR7/Xy4o9vKN33Od7S15QvZ/2gc1W8WtES26mBq3hromTlUqW+k7hZ78ZaD?=
 =?us-ascii?Q?Bv9CtAGxQkiRpwgV2kR3SgL6YcG3T+zr8+fhEy9riyZXSGmAcRz8DWp/B6cI?=
 =?us-ascii?Q?VmYe5xkVeEONJLyjGRkUTeHEfbZppk5M0pKh+Bghlq7sXXK/gy+w1mTyADPD?=
 =?us-ascii?Q?HJwnmMpf68uX9M/z5yOMRWzctuGCLnkdd9YyJRzatFr/G6mcfjj1CdnO1bP5?=
 =?us-ascii?Q?GYdJVQb47WsZKNWPZDRNy/lIB3yXkPCIMMS5bLmYki8QD1w/rX12/dsqJ+sq?=
 =?us-ascii?Q?GSs4GURQFxHG5oJpAo102jqX9IJUNooKLVCsRFXN6k3xhYFipHTjCJb9plJ0?=
 =?us-ascii?Q?v6B/3gPeE1IB+n3xKVRmNg+ytSJRhdZF1lkG9AdSPaHU1+Xmz6f2PBejejE6?=
 =?us-ascii?Q?HnXdN8V3ETOXF+j5wJKbChdimudB3uV5w43OSavr3q6AaVK2zO6KS55OWao8?=
 =?us-ascii?Q?161NEieiSXNq8YbmKgYdwmnQNuhavq+AJGv3jZFzuhEmjyrtaMsdNQULDF77?=
 =?us-ascii?Q?snHqwMNj9kkTcnbpYhsTbxE+YoVMi5Kty0siDE6ZDTBxjMlpuYJekmKrzIYm?=
 =?us-ascii?Q?DhCi7SE3bx2D/9aaUIfuO2cN+q6HDrUlIXBjh1EzB+/UkK0f4LgqH9H1Xnxz?=
 =?us-ascii?Q?DynREIaUDv+c+UqTk84yENZ2IX9yqCo8ObpyerJ6z6auiIJ11PSp9ja6YMZk?=
 =?us-ascii?Q?v2uOA0Ri4RaLGp7zpnWo7Mh4xEcUnh3KQ2KO1jprZo2K5CJXfY+KzO8gGpqi?=
 =?us-ascii?Q?IiDmfgL5RyYOj8stBJCRR3g8nNCOyTD3R5Z68mWeVXnXUbQrWyDnxc41wTwd?=
 =?us-ascii?Q?HXW60H7+Qqjhmj2KJd9wnH9r3T0iB3a+LO9h0xeanTF4ipc7FibrHENi2ILX?=
 =?us-ascii?Q?Rzx4ODKByK0PKOj3Avgj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ODN1y4tNC5G/1hH4ninnet3VLncRfNS0NZoeApOIeVCSuCzBEofnWEnfpb8H?=
 =?us-ascii?Q?9gEdk9nONYu3twP9lJocg/2OqvcRVViLlQmZXGMfMEtMwiM3q9GGHI1HwpfD?=
 =?us-ascii?Q?atCRFpix+yfKoDWWSQkTCfzQ+aKd+CZ9fALovuMnND3csi1ElVOEp4gGBslF?=
 =?us-ascii?Q?HgsOCs4hTDgxi7un5zzQVdIQw7qjaK/yXhz9KEXw4nBx55PrcqBC3HZKNdrC?=
 =?us-ascii?Q?7EztsQorhQin94TPM4Birk7OLOTqFgzA8pgLuWwYj93eOXWlGspVE9e1BQGf?=
 =?us-ascii?Q?d59RqKx0VYKA6iLcsw0ZBRXaroucZfIlznpv3MIeHSywo1SJ7SkIvd1ZRjUl?=
 =?us-ascii?Q?3uSe/3x1ENnD4t8XiaKgsfwkcj19NL033UI7OvBZP+/jforyl0JUAXIb5NgA?=
 =?us-ascii?Q?kMWneeeUNMv/6Wd9+76ES7NORmpu+TrVsIzX4eR9jdvgdTcD50qghJr0tykb?=
 =?us-ascii?Q?/AbrsllGsOgXT80jFk+sj9rpsUr64h0kpLVXoAipQmoPC/yPRsOYRKeC96SU?=
 =?us-ascii?Q?OxqsmCLXJ8t9Reili4arJ16bqUQdtt13/spBmrb/M8oiaWabauWqBMltbqzJ?=
 =?us-ascii?Q?jxSWh/Wnc9Wx1PWm1u3DNhIEM7XClWOrYxHreRRmR/EvcLdA+wBxLdKCXCpl?=
 =?us-ascii?Q?dMbICOz5Ege0Z2fcpMIa76hAMJbx6+TbTc0QDC7Ovr/KHT2jfpkzL2Z98hzb?=
 =?us-ascii?Q?Ryw/NV7Vi3QgJEBGa5qucBmqUyD3eShDnYjtfEb0TiwwzxKJ0b/WxjSWSBae?=
 =?us-ascii?Q?QGZE20SKl07icjaq+xOJieJgKVzJN3TURHs7HzYy9v75y92IeRTRXhX8prO3?=
 =?us-ascii?Q?TMe/NS447ZBoDviyVAXbVwhSkIECCny+7TNaJLEJQkYe4A9P5tdBDQfpUc3Y?=
 =?us-ascii?Q?AH18+JL11dNqdeLdZCUFm1lOWh1FNNaEA8PQfIPA6Y9bnRqwTQll9q0H+XUb?=
 =?us-ascii?Q?OGp0k5/t0aIXEF8mR044zUsa+pAskzPq5gNycjsanhMrtrB645jrEuQBM5XL?=
 =?us-ascii?Q?J9PnCE30b77U2/m92onaqDO0Xf3NXPmhNkWQQxAYNoETGn8r5d5WjJ+MencG?=
 =?us-ascii?Q?Wg16pOMXP0NNRRNWIKmUcgJhgTeng3MU27Q0KYdnqAm8bf9hhebDlHJ61P2s?=
 =?us-ascii?Q?FQAof6HkWhbmuGJ0hrF0KtQFhq9jXmvhDIsCPFuOo+pYnM6HODQLQQsuIGwx?=
 =?us-ascii?Q?jq//p+Z7a5tRJXF+mw2EFdPOgoJd9DZTdKN+Rkgg7YSo6vgv1pk8X5qH7iow?=
 =?us-ascii?Q?guT/rk54A3oZ3XQpoHcHLwLRKLaMCz6gSRpcYINRTMM23ADwRYFWlXWjvjxb?=
 =?us-ascii?Q?bp6WwsIrpLh5Vn94Q9VbnFffDdQeKznukSjeex/PaN3rNZrOWDUgD0ULLEFr?=
 =?us-ascii?Q?ecfDCZD1ddk+Duhnw827No7sh/9qKo8tRxa7JREC7VDoSMuTKuHGb3UtTjOJ?=
 =?us-ascii?Q?E4IqSmzALROrlQQxpxsh2pmn8Y8pHXUhhGg8CkNJsG7n5IRXFzO+t1WbIeE+?=
 =?us-ascii?Q?6Jl00QVycHWGXAdb7yzTfnR2hs0jhAjgSr6lAKUn2G3JBDedUSHoroeM3zgX?=
 =?us-ascii?Q?+7/9/lrWWVSEGC3eyvtLqyeEtNSjiGCOKoOZTadhRj2wDD4MBcZC47YMju6b?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2xqIeoPgUVOrRFdjnTgTWBwFxxccR/9mvqxEo8Lcwtw2tEqLkG2OaG4JBuG8AjcjxK2N/Nmg8WbqELqp3X3+bqaGCdh1fwsBetRm9UUzej9rkMbaozjt2xlbvoEjwf1WHvr3pLrHKJXqN8xfREdsGRwJ9pdbQbu36XTxKhT6lJv7ePtSgOk62iOAv5XVi8QkMmnnGw6rF2Y9B0YRuQ3qJCymRjZJh8dinYCCw63krseLSDV5Qkl6wXlCRZO84QiBkFGNHcinde8qnjtiubwFdBj/SY7XuUlo0MXlidMqsa8ziQqe0T+Zpha3b4IJlJmhucVylDt/LzNP2SihZedmluC3f9cQYgjIQwFq8H8/vlwU1iCAGU8AVMcku8CykB+c8k7q5Lv3L2LUJ/zDJhTFmuYL4xMuu19szf7tnuCMaYa5u9VTFpI7a2Ofs4Bco7DYWNzP4Oc2ZwqzSH5IR6IOxloesG8EjBSrtdJDuS9N54wtmjFJxC/8up2GMkR8Ixcpq5n9IbAzFL8gqoADpB76lr+DnKT+oGlwXBCBVistht7L2gk7u8NrSoBk+gq/hK92wJkNr6B6jW++MtIRXwT2n+2PN0Zu07XEs+K2PERs9gk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7836e58-2e74-49f3-3978-08dc9062b228
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 13:21:15.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZZmqop0caLQoXWyk+7uVvroied3tUZn2zH+TkVCkDGQb4PHtjC9LGdQlbyeXlkJ79sQSkGUX5gu8lhZ+BXVFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406190099
X-Proofpoint-GUID: DarSELBZS9aXz0XSUvG-wYBrPjxI97lw
X-Proofpoint-ORIG-GUID: DarSELBZS9aXz0XSUvG-wYBrPjxI97lw

This changed the block device into a component of an atomic
flags word (so we need to change the .d.in as well to pull in
the relevant #define for the blockdev portion of that flags word).

See kernel commit 1116b9fa15c09748ae05d2365a305fa22671eb1e.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/io.d.in | 6 +++---
 libdtrace/io.m4   | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
index b3da517778264..f44f53f092dce 100644
--- a/libdtrace/io.d.in
+++ b/libdtrace/io.d.in
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2012, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -69,7 +69,7 @@ inline int REQ_SYNC = REQ_SYNC_VAL;
 define_for_kernel([[__bi_rw]], [[(m4_kver(4,8,0), [[bi_opf]])]], [[bi_rw]])
 define_for_kernel([[__disk]], [[(m4_kver(5,12,0), [[bi_bdev->bd_disk]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev->bd_disk]])
 define_for_kernel([[__disk_chk]], [[(m4_kver(5,12,0), [[bi_bdev]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev]])
-define_for_kernel([[__bio_partno]], [[(m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
+define_for_kernel([[__bio_partno]], [[(m4_kver(6,10,0), [[bi_bdev->__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
 define_for_kernel([[__bio_part_dev]], [[(m4_kver(5,12,0), [[bi_bdev->bd_dev]]), (m4_kver(5,11,0), [[bi_disk->part_tbl->part[B->bi_partno]->bd_dev]]), (m4_kver(4,14,0), [[bi_disk->part_tbl->part[B->bi_partno]->__dev.devt]])]], [[bi_bdev->bd_part->__dev.devt]])
 
 #pragma D binding "1.6.3" translator
@@ -98,7 +98,7 @@ typedef struct devinfo {
 } devinfo_t;
 
 define_for_kernel([[__bh_bdev_dev]], [[(m4_kver(5,11,0), [[b_bdev->bd_disk->part0->bd_device]])]], [[b_bdev->bd_disk->part0.__dev]])
-define_for_kernel([[__bdev_partno]], [[(m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
+define_for_kernel([[__bdev_partno]], [[(m4_kver(6,10,0), [[__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
 #pragma D binding "1.0" translator
 translator devinfo_t < struct buffer_head *B > {
 	dev_major = getmajor(B->b_bdev->bd_dev);
diff --git a/libdtrace/io.m4 b/libdtrace/io.m4
index e837ef65b86f7..d57225c911059 100644
--- a/libdtrace/io.m4
+++ b/libdtrace/io.m4
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2013, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,7 +11,8 @@
  * to replace those tokens with their values to create the finished io.d.
  */
 
-/* #include <linux/buffer_head.h> */
+#include <linux/kconfig.h>
+#include <linux/buffer_head.h>
 #include <sys/file.h>
 #if 0
 #ifndef __USE_UNIX98
@@ -43,4 +44,7 @@ DEF_REPLACE(O_NOFOLLOW)
 DEF_REPLACE(O_CLOEXEC)
 DEF_REPLACE(O_DSYNC)
 DEF_REPLACE(O_RSYNC)
+#ifdef BD_PARTNO
+DEF_REPLACE(BD_PARTNO)
+#endif
 #include "io.platform.m4"

base-commit: 454c6d47bf408415f7eb52ea701779f041aa6957
-- 
2.45.1.275.g567cb0950c

