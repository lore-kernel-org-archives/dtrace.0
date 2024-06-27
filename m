Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1901A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466710; cv=fail; b=fAc7SwOTASCcFrX1otbBzQmUTKca6dzNbWL3s73yoPfN6YgxDOJ3A1HBIk3WiyIycWk1K62tXNMgO6UhHxpeFf3S8U4hHL6eIVHj8eK4OcROqwQ6moB0iJcWnaa0X+YgMEtRLhV+scD55rffeoTl1NGFKEX2Aw/iPLUKZCiIeoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466710; c=relaxed/simple;
	bh=7pKp75FsSxaRO5mSWUYLArCwRHBaOSK+9Vc9eAppWM4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e+VME3+BjkWS0M6dJqf0i4abtWF6cJ2+JN3S+H6+iW0fg02cmvnSteegvMOMVfimut7N7pVmvvpkhLuTnnFMzKwOrZOOEOQ93DmV4VtEhi28ZtyjuMKqP8fvGMkGA9VABItNJdxNov9cfgfNbGGB3zmiSCuHsqj363FZ8iT78PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cVYOcuaK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mSmTRWXQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cVYOcuaK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mSmTRWXQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMShp013835
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=wS4Z9iylzD4bvSC5FEkXkxfY2tgNgjJ1tbrn3AXGudc=; b=
	cVYOcuaKoD3B8sgK+kSBPqwE1FWNxBo1mn7ukOz6K2CSw4vdrcLT8t0rnyLRqgda
	OtJUtnsRZ+Yb/ttg8zsffAGbn4dXkAEXLqdF/hW6u+m2NddtHWCDCLM2+tjqE2DC
	rAHg/WLv/jixMuS+yfftJ4YM/uXAtYv88pIJqlTp1HbBTtiGn0kM1vJLZgeT5tOX
	qYG7w+8RjuB++JswWxXx8WTqXrGGkXjHDe7DgHS5OAGKSLfHTfTFtZJHrOAV+Pu+
	6jw/AXEYuBnG9nAlSPk8xCrXit8/ZvQvWCsjjJI+JTpD9Yo0JUPOmsda3h0DV7Du
	5XKXskO94ddMPzEV6Ig5Gw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2n0xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:38:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R4dCWU001339
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:38:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2an156-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:38:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJdW3OiP6JI8/0b3Y04+NTIkLUMopbu+GXMZUeMdgR7rQZO2icsbmT0S/MQkwISXbtJqkxrYcE2z8DiMv+FqH54CvHq3BJS5wXRxSr0uR5VUTpaVOWqXueipVcKJ7nAy732rO94XiW/xW5LRjtovBVQjK2H29KQgyP7G5f4u2Z0p630mEJm46Wnh/G/69jpBAUi18vp+W2VnL09lr1wP+CJoSYKabvoT+tdJD6tQLpK9/MZ+F1zPdSrIaMh+lxFlnVDBcH31IjvpMYJm8M5BpE4ig4Ej627ZnPMTDoFRYn5BrRb0g8jXHk2HG2guyGAlxFC/6vLEYUMmNz8Ey4EMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS4Z9iylzD4bvSC5FEkXkxfY2tgNgjJ1tbrn3AXGudc=;
 b=EU6RPmaocH/YOLF3cEu8Ylug3TOvZDA9X9mQ7/r80feG8ANfH+IGY9EG/eePuqheLPBJABoGAuT7CEBgTgXIcd/iONjcFdLdQrs8sifiqqb5IDOLSyCiH3A4+L8jQqA1+dCqsCq83jdk7KkdbTS8xG308oX33GQAYMoD2o/ZP/55k6ETOv6vXpI77KUJNVz63AyCjUWKPk43TfvzceAe4g3fjGvJ81u868Rd4S5OSTZ37mP8YkjpyO+UnQGbzn+wfXyLJzj+dqFowD5khkVGkfyRS6bXUjwpNJZOJx+/HV/P1IaCplF2EGfrHO2xk3f2fCYUYJhzoK4LVTtgCFkWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS4Z9iylzD4bvSC5FEkXkxfY2tgNgjJ1tbrn3AXGudc=;
 b=mSmTRWXQhsFOMNz0HhLUfrYfxSquj/fR5xuhPK3Jb4UrCjEEiJpKxn6OhinRz6sljhaxxowGNlAfWvVHF2c8d9SnCT8lDn7nXWKSOrRw5hpc3tRMpQ0h+f4xAtHPyCLw5x+XtJG1UHgFBS9WFYk/Sa8+FuX3JNaprN8ritoQ7yE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:38:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:38:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 19/38] Retain probe descriptions
Date: Thu, 27 Jun 2024 01:38:10 -0400
Message-Id: <20240627053810.21928-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0299.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c17248-8753-47e7-56a2-08dc966b5676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NAiEjMiB/Vc3TjnSnWgO5DHRP8Pvc5Tdz/V5V4xdkbLj52qtqcRFqbhCLdPa?=
 =?us-ascii?Q?oTyhrsXJS0plKrUVyUd0tbW+VW5LXiOCn4rihULHVej0VyM6ylPV8T+pgNuq?=
 =?us-ascii?Q?MzRG8LVhFmEmbocion3rgi1FkIRm0S9ybBuosnY2QdqWyvKiMF+gEmcprums?=
 =?us-ascii?Q?ZDY5j2UsqaMm1yicy7c8qlmVOuwecZyP+NlTRE6IDv3TkU9tBqgf5Q1du8mB?=
 =?us-ascii?Q?YwdQ57x0EeSte3J6RNPoebNwVmnQLjkasL3HC84pSVO9sPMpHuJiwT6Ln2w5?=
 =?us-ascii?Q?Wx2MQzoUgxg+atwkFHNbFxjI51GNJSLdP+4yPKqgcCp07jneHBx6c72Jn+cM?=
 =?us-ascii?Q?nMm2JX+IAPIyk99Tu4WEqXPtAJ533NRZ9mEmqO15ljIiZabaKPtKXRY51AUf?=
 =?us-ascii?Q?bc1BpP0EmUy7jnZrGu9i5GY8aCnKke6IkiSl7jctlATXMM0DSJpTR4X75j3Z?=
 =?us-ascii?Q?yehm+ohbNbfMNgQbMNbiaMXEIguW91vhtbaV/EBZDU7yI+nKyN1O3llqyK2q?=
 =?us-ascii?Q?yY38SNy/3VwCyMvyROvbS4VCFuyCHaBAiOS3egVrviAU2YUQtCNTJXx6DohM?=
 =?us-ascii?Q?BUPicurTdxBU5uAB3fF4Ip8yiJoEhP2rgxg8eBD57fGR/hYTFdKXvBAFVWJ8?=
 =?us-ascii?Q?Tg3bA0lApzE+S8eSrQZkfDHngGqiUXXA+QBmk2UqKv2Ot1fr9dtR1V+NDIps?=
 =?us-ascii?Q?jbhWJdwUu63Ynq4iUavwq5AW9VVY4EeC0fnzze+YFxjSQuCnn0qZJNuqG7+K?=
 =?us-ascii?Q?2OH76Rb+CGmMaKu59BMQgzvKvM0F8tZDv9S2MIoMurtJc3YkYcByv4u+Q8oB?=
 =?us-ascii?Q?MlL4SP+8zrfrtT8w+01rKl92jsdl2RhH7JW8PSKaod5da2KMm+7QMnkM+6OG?=
 =?us-ascii?Q?Z6oQMJQZ4krutMxBV6YjZsDZ04qfpHrI1PuUmpIEeuUhrUlXHVK3rslEUgxm?=
 =?us-ascii?Q?6z430/e8HbbAOr+w7ULbAF6gsviGwRX8OJWUZxp2gStEuBNr4IIbO0Q91daP?=
 =?us-ascii?Q?Z+AuZE5WXdKMjDuQOnhneslQQQz2o2mp7JuyhCXh39DqKVcrN4U36cV52hYs?=
 =?us-ascii?Q?kiKiLn3kPm2gRdA4rhJcs+JfwMXMkzfMnmSzn8f55WEaMvk0JmY9LZNIzsIe?=
 =?us-ascii?Q?Zu7kv+cB0hQFRjE8gvtsD/JTQvcIFnQGY1q1ijdG6AOC7JfV0wt2L/IH+otg?=
 =?us-ascii?Q?ManLGUXbESsIMBk3LXPJpkI3o+G9RPg3o32gm6rQuaTI9CxWqSmF1kLl0QwS?=
 =?us-ascii?Q?OmJPu4v4p1hnYv5Er0I+FG8TdyTNIGbhFRulYAlE5G5yMa2fiAZzZLPs8MEJ?=
 =?us-ascii?Q?uwaxo/tB9OIZ+aMtL51dHLxB9a/a8gM9Yo036wOKv0YQKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XOxJzXHJ+Ib6XPPrQUYnI612QgLhf41DLE6Cu1qtKfIX2YeMRmUUnRhzEtdp?=
 =?us-ascii?Q?KVo8Gsvm+jaWGBKWL/mVHgyi5ooW36ODW35NXAgS0pl/EFmkhOeH7auJs2wt?=
 =?us-ascii?Q?XtinsleJIKWa3g59kP5lOwzHxlxXpaCn/5Ixp/d3wu8RHEaKuQVtpymqvk1f?=
 =?us-ascii?Q?+ZIApPImJF8wS/pBawcuFvgKo14RaaQhmvUvpWbwhjvqyI/45ArZ+bRqxsUA?=
 =?us-ascii?Q?uEubPd0XjJWyhNvlf+O/LW6ekMPQXdVc18pMT3Gi8UGkrgofyukGGBXDaEGQ?=
 =?us-ascii?Q?l5yuICX5N/l531TVvPIkR4bbhlC4EMDjX7CpiWQ2buJYcsn+duG2weM7SCGD?=
 =?us-ascii?Q?FRHLRTPWolSnST7VlyOPzFctiyN+zI4gjECeN9v+odXgwcZV4B8onlqHH3zb?=
 =?us-ascii?Q?L87da4mL4gSgqwWZy2I1n/PUJ4L1RnTcVNjoT7SW5PQXUYSMEsIelGYQdcnQ?=
 =?us-ascii?Q?PunLyqQzIhMjnyFIVGypTt+dB8cpA26Kb5Jo5VrkGEC18Wup1Wn5oK2UwUsR?=
 =?us-ascii?Q?5LY3nWvYMCiVp6iUkwcqacDDgp9sST2uUKkRugAcWzWyNnTAb59YaM9qWCZy?=
 =?us-ascii?Q?zKNxVjW2bQ15TNEmrxzEa68o1xyWZH07yJTQZLjaVZoq7uTLTRwea8uY38Qg?=
 =?us-ascii?Q?eqOuhIg31n+F62EcX+6vD9nl0ywppa9WHj7ox+DifdbEGurbDgt/fE3Ua1H6?=
 =?us-ascii?Q?4XPWHezdzcOlECc+CeI6lfykZELB7Gk5rYuD7+wj1IExuaiDGu2HG3b5AcQ/?=
 =?us-ascii?Q?iQ/A+K5S4vxJ85GzI06M85eHRYGNlvRCSN+18KtXk+IOtaNkY+NgnXGHW1Va?=
 =?us-ascii?Q?l1KWNmGTIaLaa9sGzHxj3lSUrr4njg4ypsp5xoNpcNl5Qri8r7B41ROlLDyO?=
 =?us-ascii?Q?BldlmlpkS/H1IwG8h+b9fbBpyKSN8NSEXdtUVlhIUcch6myKFc8A9xUHyhej?=
 =?us-ascii?Q?OkcAeVhpxTLFSR0179NqFifQmxDjXNK6d0dlY1R3DguXGI6JvhAsobQuHx2O?=
 =?us-ascii?Q?rnJv8KC2KafnMnfBiajPO3+H34FAFn1ucQF+9gXmu+t8byLURO3+SuJAMKtR?=
 =?us-ascii?Q?n7ISCW0ch/boKQ2bFaqgAcN7RPPwaHrSNrhxAfl/oN7AXubjz1g5zRdGAw2W?=
 =?us-ascii?Q?pRob9IB80yZ8qQ7LsaU5Gd3bxT4RMMXKcJOqDETJ3drsmrP2NA+et7sgfZgt?=
 =?us-ascii?Q?JpQb3FcQKTl6HIrbNH7/emNIOqCDro2aD0oCzE9HntgcmhjCaY07EVHpXya4?=
 =?us-ascii?Q?6JtwZ9wrCgXKjphsL4BaPBeM4ebxGBDhMnzUP3QbL9UvuVXT6X0pHX7aOHV3?=
 =?us-ascii?Q?dpETgisFXxBYcpOZVACNzzhTip0FaE02sy7NLApRiI+SfZsqp8tx5expJVt2?=
 =?us-ascii?Q?zElJMLZ8caPIz209Ep/rA5qLU1LwjR+RdUz/G5qf6StHDiFcimVulZgeOFtO?=
 =?us-ascii?Q?4Y+YJF1UFNTxTKR9YSDl4WYFi7fk9yhHs3cvkCYjMGMmHsZqhMt5w5+cssPe?=
 =?us-ascii?Q?vwfX45ldOJnAVy7dKYWHnRr6x6VrlkkP/U5sUBmj6KyzcEpjIIT4fi1Y2M+N?=
 =?us-ascii?Q?xySvCQKgh1JGecsUFDvulTTYvbXnkvwUe6dkJyYB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	A3/HhaAuq2S6CKz0hvn5EW4PQDT2rP1u+IIrexHbrQpTXjEaYmZFVexdy3jiiVbywqb2K2cl/T5EvgG27U40uNRlmDmzY7IU9fTtdt8zc4s8+a2iqiM04WNMsjjKw89pLdLN2/CvzjeH3FmfEd+XNyHTaMeqcL3Ycnq8VBYRJzila9pBx33HT4r5j5YEk4Kk/hxUWiktGgKVf9Cfa/40+8yK5YapCKaEtUnFhEbzp68vm2u5R9LQb+ORlcMvfuY8ObImJ5zen84fYa7RTujbhZQiAEkJewzSHBNAxtESppZl5rN/jckBGVzbXMXInduF65PRgbw+qw2qIGNjYNWrVvfY094OnyYSX3Oc5iHBNxPsauYhGN8SYMg/S7zvoQg+kcLUWr3u/liKo77wWOdlWXNvDQIriRxbVpu3jlEvjyw4Q3tWRVHe9NG0b2rSV+Dk9s0q2hJuRN7aoHodhSYYoGj0bU+V1r/Fysg5d5HUlIqZr64LLxnX/jhDombmO5Mnt/uU0xbnz/az0GqSismQy7fwWsO9uuCxFd6VmwhX5olOLnPWDKEp89Ifals/yShqgaFTztA7UD/MIDwTtF2dc9Gv2A19Y1WJ8bHylkYzG30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c17248-8753-47e7-56a2-08dc966b5676
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:38:14.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwe7YAhrYGneQLWl63BMCAy5YY9DrtQVJbSPQ9KSb4j2EJrH27KALFZEi3x0NJu8piLST+d/93dbtRM8tH6bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270041
X-Proofpoint-ORIG-GUID: 0m59D6xXI9AIFwncV2HKL3PdLlDx4v3S
X-Proofpoint-GUID: 0m59D6xXI9AIFwncV2HKL3PdLlDx4v3S

From: Eugene Loh <eugene.loh@oracle.com>

To support matching probes after dtrace has started, we retain
probe descriptions.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_impl.h    |  2 ++
 libdtrace/dt_program.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2132eda2..445cd602 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -300,6 +300,8 @@ struct dtrace_hdl {
 	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
 	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
 	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
+	dtrace_probedesc_t **dt_retained; /* array of retained pdescs */
+	int dt_maxretained;	/* number of retained pdescs allocated */
 	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
 	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
 	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index a4b052fc..7106c249 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -163,7 +163,42 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
 {
 	pi_state_t		st;
 	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
-	int			rc;
+	char			*sclause = sdp->dtsd_clause->di_name;
+	int			rc, nclause;
+
+	/* Get the clause number from the clause name "dt_clause_"$n. */
+	assert(strncmp(sclause, "dt_clause_", strlen("dt_clause_")) == 0);    // FIXME can probably drop this check (make sure the name starts "dt_clause_")
+	nclause = atoi(sclause + strlen("dt_clause_"));
+	assert(nclause < 65536);	// FIXME are we okay here with some arbitrary limit?
+
+	/* Grow the list of retained pdescs, if necessary. */
+	if (nclause >= dtp->dt_maxretained) {
+		int			newm;
+		dtrace_probedesc_t	**newr;
+
+		/* Figure how big to make the array. */
+		if (dtp->dt_maxretained > 0)
+			newm = 2 * dtp->dt_maxretained;
+		else
+			newm = 8;
+		while (newm <= nclause)
+			newm *= 2;
+
+		/* Allocate the bigger array. */
+		newr = dt_zalloc(dtp, newm * sizeof(dtrace_probedesc_t *));
+		if (newr == NULL)
+			return 0;
+
+		/* Copy data and reset the parameters. */
+		memcpy(newr, dtp->dt_retained, dtp->dt_maxretained * sizeof(dtrace_probedesc_t *));
+		dt_free(dtp, dtp->dt_retained);
+		dtp->dt_retained = newr;
+		dtp->dt_maxretained = newm;
+	}
+
+	/* Add probe description to retained pdescs. */
+	assert(dtp->dt_retained[nclause] == NULL);  // FIXME can probably drop this
+	dtp->dt_retained[nclause] = pdp;        // FIXME I think just pointing to pdp is okay.  No need to cache my own copy.
 
 	st.cnt = cnt;
 	st.idp = sdp->dtsd_clause;
-- 
2.18.4

