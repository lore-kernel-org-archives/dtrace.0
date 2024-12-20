Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92153227566
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733659; cv=fail; b=s0U8LcuCdj84BwwnxHy8Xk3z3CxoGdX6AL3o6FBtI+13bB02vy2pBe1Kxqzuar8nGYPWnQeDedYEYHc1r4W5jOPebP97ZPc1Qavbf1fYDh4RvXMwE79ZjMfcIw48qj+72hHb81ItEdZpmTEKX3VeonM3crxy4iStdsYoWmYOXYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733659; c=relaxed/simple;
	bh=ldHtDmHG7rQMUZsO4sDJK2Xv2ryIJnxRSIxh3keGlVk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KyZlbIWfEVYWkq5QPQwC83/h57yAGGHl0RrHtFBztxr3itu9WLm7QcoRGu/ylbZJBUE4cYc6nqwigPRcTt2+ySwruOzUuXQ9ldHHU1zCGmHV4TWs4vRKSLQUTQDlF/i7n5bobUDCq4JyR9SjLpW5qMZcL/BECuQzkiUjSu7Uma0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JXz+dCVj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bu5Llshr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JXz+dCVj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bu5Llshr"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNL8o025076
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KwSfjO7mupBiIY6zs2
	3QEB2ZCm8iOw9NWR0lKQYcnIU=; b=JXz+dCVjewkLI+6glCRJS5f2pmy1Pks5Nb
	DrbRbaJXse8JBD3L+V/ttSiGwUmi+iouCW3+1RKr1lMR5X1cbFjzgZVCqal3T9MB
	ggY6caJtq+/30pEZTnfOXhgSjj8PxNJV2Sgn0nWZG/vtOteYu1NSga7IpV5Lgcme
	9iW6xQhP6Z0dilifkdIkOzLa0qL+4R/1HU8VoERbqaeGCZKspW7JPBZZN0kjpIfw
	ha9Sq4tXrL3d6l794aPfic2k2xotCM+Mei1nWLTmAL7crBbW7hKbHYiUwgOs3kyc
	H/ckLeBUuRC/AEI9eTOtS/u/TAB+Dh/S1gVUKesctjoO4+tJWRuQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0t2p0vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLr7sq010875
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcs1j0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM6NIoaBbMIEns1+Eec8Fyl7AOczi4F+CT16HqUhcrhVwq6MMLKfzSUs0DmNolulVydzTe4ODvlTwZPaAS6wsVyv6/nPH4XbfNIVzTY09b25y1ifGLpj0LV7wZT9T5IbnSzwRQO260U6h7ukOjEHJQYbfKh81zBV5gbayaR4F4srnVaLyF2iHZr7OEB6EoChsk8FgQYT24ETXXz1BjYVR28toshcDyXqiDv2Mj/0wvdEA5AC5wiJ1/7/v01IJ41PIB4R79HE/SRjUo1SqKmgllMV/O3hSc0DwYYjtWCDLbb6GZiLoMZwSqos6yVOrToAAx/plq8vD1n+KEuZCOu+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwSfjO7mupBiIY6zs23QEB2ZCm8iOw9NWR0lKQYcnIU=;
 b=U9xZ7DgL3uf4xjRlEL/6K4/sRMa0fyLhu31m9vbV/QCzE3vO8DhkAxFj/ANkfJpGZyAxMFI6o1eZ+IMOJaRCv5zd2hE6KXb3+u/qdfciTcLRifdnNkXNSq28Lz2CMjMXE/cCZS4CeY8XfmFq92Ck2NQtLqT/kpYmTPyIniuhcXQkRA101fzTCTvTG/aqipwU8wcPvqNCcac8Mt+WxgUe5JO1gTYbu4jukiEa10i/M26TFO1wlVQA6b02c2nRa8FteRHIOucFFu/158hBmwe7fSgVUzjgk53eKyeb84jXZ0HxgWhprJ3gzIIokNOs0DwaBvhuyGHJ3GUDN0KELCdsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwSfjO7mupBiIY6zs23QEB2ZCm8iOw9NWR0lKQYcnIU=;
 b=bu5LlshrtGoZYNfv9rKmOdQ+JZuKq5SHieiDqDU6oom+F80lCHTGK9Cd5oIp2tH7x0eRkqxO6BvM7KymT2ZlEImAn4e7mH6Y5cexJ36j1GzTArX+zn6bWFI8fpBz9PLgpaLXJXP/UyMgJkp0dYLWqppZuoOOHcJBLa7UTLpGyx8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 22:27:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:27:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] test: Move disassembly and extracting PCs earlier
Date: Fri, 20 Dec 2024 17:27:15 -0500
Message-Id: <20241220222716.18511-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222716.18511-1-eugene.loh@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 23298348-d500-497c-89a6-08dd21457f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ReMUkWh+nWRHzviqAP79tSoepF5+E+TlZmWMlHJovngo6o/Biex8ALEU9j4U?=
 =?us-ascii?Q?Kvu+ZSQrZAzRg/2G6gqo1h8a8ReSMa8JpW1Bmo2xpTYINkrwvQdKOiP6SprD?=
 =?us-ascii?Q?6AGhAp+G2q4Z7/zc30L7EmADEjEiEC6VTpd6Vd+meIPQcTjBm5qiSn2Id142?=
 =?us-ascii?Q?06qhZAwtYPyhWo4EnBPk82ivY7hXJfa7YEmYfI8K/I7AbBW1GdXKtBEhLtCI?=
 =?us-ascii?Q?p5hDs8KRJvfmGZvdR8mKGypWGcDRKss+SHnIlldWMJlRyMql9xhAogdOJ5Rb?=
 =?us-ascii?Q?I/CxKekcRK1LTBJechBerHe7GlH4HeXtMijXo4EINyZTclTqRhF+Snr83H/b?=
 =?us-ascii?Q?I+3obi3iM3/5BvcYzNPhuqJFaTtrItJLRxKNS2LljKZipjkjw3Ar3czZ0ZcX?=
 =?us-ascii?Q?UX+GSAdgkVae80H79nKfQ6KQyRDGVNO7NPvhMfpW8KMX/Fjz2j9JcZOnbU5d?=
 =?us-ascii?Q?71v2WdWRUsI8QOz5FVgb1lJdmGpg5JpQrFQz5Yk6pAJ+aaK8Ahcn5TC7bysv?=
 =?us-ascii?Q?2yX3SolBoAq/EkCKj08wB43bhtNm8sbyqU2bc7cTL+A3wB++NCk+nA+dO4Yy?=
 =?us-ascii?Q?rirwxILrbXRwsdDLqmuWHm25M/gy/Q14LJTiUKOKOOz4Qw934ArqiFsI023M?=
 =?us-ascii?Q?zRG+BorPkRIVBK2VhjBwKliIfG+qTWNJ+sshTpyWpNAWHo7g9vmq5pGdvhmc?=
 =?us-ascii?Q?BY/V0ox//2YvMuwEQQF6ZnL8tAIYSF+UzkaQQyWMKbJhU5ZeLqoShRDO1xtB?=
 =?us-ascii?Q?uhV3S1nAdiL7ecMjNE8qiWPLxe9FpQTjjttmNLB0EixUklbL5EbT/4EJQyxI?=
 =?us-ascii?Q?t/RgnMjdWhzLZHCEaithkefnIETjUpqlEgDeEmw13s0GCioewWzzktLMqhMk?=
 =?us-ascii?Q?PPu0wN+PqhI5QCZwk43ZP1ygFRYW+xCNopshwo7c7e40Ajly43c+s5ccr7Wx?=
 =?us-ascii?Q?f10zfFiS+7Cw+5hX8baRDhRpIfPEArgU3OR5alnhKdfAFSwH/x9ioqP+XP8y?=
 =?us-ascii?Q?r/xCMhzoWSJ1oNnKqFFxPUm5DQbM9Fb1ivZZgrhx8pwoWnHGcZGKvN1qgScr?=
 =?us-ascii?Q?XtXgZEQrQR9Qwnd8C1AVLFGgcymHsw7BX08dFfccOEIuskvQ/xWdJ2ljIwTM?=
 =?us-ascii?Q?m0u2KGQpOPiJg9CUvSkEP5hs+Tdqx9y1J0uuTd5gajIZ0WDGvU2WE5saPK9i?=
 =?us-ascii?Q?5Ter20unnus1XxLzLe3McB1bqct2Wdy5uUqxZ4KE7NaR931G/MIvJUsPvxGd?=
 =?us-ascii?Q?q78GWq2xEeRehvixCZ30XXd1AOZIi7evRKdnfn3pj3KYtvINtCpNfXPDAJnz?=
 =?us-ascii?Q?MeWb8icc9F599+x6t1UupHsNk8NoZojoPTdP12wNq5YhqGyeDYeRH4VvjDgC?=
 =?us-ascii?Q?/VTCHX1kNqqYblly8cKYxt19qVBC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?52ijebQ0KAuz84+/YIf/gDIFLyDgPomK70wOdPiLks6bk07qLMaYRnYm8+3A?=
 =?us-ascii?Q?BxhL9JGgeRP3a6AUmxaHpdVCoNYi6bJqzyqQ/NKl+oH6m1TJHS9UesGek1/c?=
 =?us-ascii?Q?fW1cS0nZqdD/7RyaS8TQnoslvLMPA8ujrpyrarqYmo/JugYKc/m5ui0+1hfj?=
 =?us-ascii?Q?alINQBuqsYMHiKPXPy0uLIdFtuPHnK1YUgltwZgNZIVnXiZgwr/hbINB+re9?=
 =?us-ascii?Q?euerk/HfV8hjTyOOZ4KMOg1fDtue/rsyAOFNkODb+fmE11r+j/CHNtrW61sL?=
 =?us-ascii?Q?H+IWxLCUwVXpPmtReC7Yk0xb0BZgOkgzdsZQJmdUpepXm8Y0m//vDkIUmE1K?=
 =?us-ascii?Q?LzOdrky71Xt4uk5Hgn4t7b013LMrd5rOgDVtsc/QfMOi6LWe6W/O9JDMye8q?=
 =?us-ascii?Q?7HRFPu2SegM7lXCYMcrhc1Ti2pAA2SoWV84f//7tAr/GJ+DGpZjkWlALaP9V?=
 =?us-ascii?Q?kD47srPBe0vUedofYq/yCOSZ1Pc+6iNCgBxESM8OkwnRKgAnDGrURcCiMENG?=
 =?us-ascii?Q?OMjuW9NJ4eW/vWCzVk8JOCch1iocx44zHt8UTfS33vWnnPG5he7uP76Im02e?=
 =?us-ascii?Q?Mr1c5VhTCKAfjSjLqbhrdP1yvffYb6fc/ycU9sVLupRTMjhXQnKgwdQ/ssBO?=
 =?us-ascii?Q?AM9yH/7+BsqoO02jh6f253as1LiA66gwZ0m3B1+1w/5WI6dkvSvsyOYqj4N9?=
 =?us-ascii?Q?l69l9dYZKlI5H2ht7U6UMaZmftkSq39zyL5XLQ/S2HW9ydVqFCXWSkxURuQu?=
 =?us-ascii?Q?Jl+/3wO+zbVhH02k7EW5g2SpLAVbRFcLRPh2TXZAcHm9TvtnYe4rVgYrwTHm?=
 =?us-ascii?Q?Jg9L01GE++s5NPaMZyCqt8skbsFf/XgKnd3PJ1LQeFPmmBqU5bdgKv5L6KQP?=
 =?us-ascii?Q?bSIRvjNWxtHEQmz8C8y6HCnflZyhuNvQfWmg6+uMEumD99hPJU3iwcQy4ylb?=
 =?us-ascii?Q?crQJj6bf9ndMDmAOE1nGRoURE1uZBqftNb4ZrnKKrarVE6168fVP1YGB0LP+?=
 =?us-ascii?Q?JDIgdvoiXP18nuuPF28l6bIrIhS9pHhmV4BPfmT9yk3qg6LCUDlNnfkv5CIW?=
 =?us-ascii?Q?Kv419Amo7Jfp/55ywxhnygKgQuRP5k/Spu90IkPutBEQq2FZ7Vp/Ks8pIOw+?=
 =?us-ascii?Q?fmv5/apWgODW2L6rNvpjV1cMC0qXAYiEhQ3Q7pGf4qtHXPDdee+OfMmpD+cD?=
 =?us-ascii?Q?8nfcy45xoPMQbaaLhT9Gx4zhv6dhnuT3FdyDYzxKqkE2vLA+RCbucL0UZudH?=
 =?us-ascii?Q?mJfCe+9rO+miKOvVADudwyc7ATiDf8LVJHHmrT1LMUJCI5yQxATgk8l2rEGj?=
 =?us-ascii?Q?0jeKc2RFC9ZbbU8YJ1ojZzNxQjiZIdn9IRfM+6gLMYAiEWIQ4TqTVuA24kmL?=
 =?us-ascii?Q?M9OPCl5PnQupTH30oL0dEX0n9dWiCQcUFpoGUV4g5Tbj9TOK9FWXysiemqmp?=
 =?us-ascii?Q?QVynKfWzeT/GP8EajEThpcwGCURCo0wNf0B7vAxrm0Uz7vgcDlxN9gQ42tm3?=
 =?us-ascii?Q?+w2HhBuGUx1T/6dxAnOOD9tbpfb2x6/C79w5JESboIh9lBHcr4oBPezfMU7u?=
 =?us-ascii?Q?MYQjJ6v+iJ6Pmj/WAV/SElg7wHJXYfeXisO07rf3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1TKNmhHiqn/3D2bJddouhb5Nv1f3Us5i8nBlfJ8zjVCQvvR4FeqtACDWBUTp6WydnBUPjF9Qi8ERNjfF0m+o5wjQJbBpgglWztCfv+MbojGQhNSYWEqz4EtsRKZ264MIkssmyAWtZPg0walSXYr5ULSYT2rxSIwIzANBML3gJQmpjto2VWpZAnr4c0Tlwm5sxNVAsU55q/HDJd9ajb14H7qhq8w6wxc6XY0ryznJdzxv8aLY1g5PMZKAVEWA9bDAbY/qLonpKiiaJp8OOSrnnun8x1Vz5DZpDgxMN+UboBsxjIJBfkLR4yCS7Gv1/LtZwXWdaVj1FSYzyA+u1Cv8Y2gS0KLp7OWE+X7Il+gH7Z5WKcFdfbbKv/7n5DlCyXA+W3uAVQflt9o0JfTfNLyOPKN2FbdwvSi8p/Y6O/JAwi1Y4B0smmfKaM87tPmmeSERLTrE8/gKK4ukC1kD/yhXG8qO6gQ1EVa3mMMWktpLXt95P3rclrNe2EzASyjqOyuCsJepqn5i6m+67BJYLUOVKuixr9awBhkOjIZ6I/xaejAaqzBYEJBdP+dFg+9SzNuCt3KFrebKLZtab+ODipfeb2FFfv6iVKRGQzcwZjBh3Ek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23298348-d500-497c-89a6-08dd21457f11
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:27:32.6386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pVrC+79WPgPxXauio7oGpNF70VfhCrHFYGdS+Syduhw/3GdX7exRmwVjpK97Sy0SsH6u19kb2x5RCSDvpS88g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-ORIG-GUID: L9Pzhfy0YGuDJ4htY7ad0JTJKHmmnb4K
X-Proofpoint-GUID: L9Pzhfy0YGuDJ4htY7ad0JTJKHmmnb4K

From: Eugene Loh <eugene.loh@oracle.com>

This will allow a future patch to use the PCs earlier in the test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.sh | 38 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index aa7dd4bb0..54444d49b 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -102,6 +102,25 @@ if ! diff -q main.out main.out.expected > /dev/null; then
 	exit 1
 fi
 
+# Disassemble foo().  (simplify with --disassemble=foo)
+
+objdump -d main | awk '
+BEGIN { use = 0 }             # start by not printing lines
+use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
+use == 1 { print }            # print lines
+/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
+' > disasm_foo.txt
+if [ $? -ne 0 ]; then
+	echo cannot objdump main
+	objdump -d main
+	exit 1
+fi
+
+# From the disassembly, get the PCs for foo()'s instructions.
+
+pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
+pc0=`echo $pcs | awk '{print $1}'`
+
 # Run dtrace.
 
 cat >> pidprobes.d <<'EOF'
@@ -153,25 +172,6 @@ if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
 fi
 pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
 
-# Disassemble foo().  (simplify with --disassemble=foo)
-
-objdump -d main | awk '
-BEGIN { use = 0 }             # start by not printing lines
-use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
-use == 1 { print }            # print lines
-/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
-' > disasm_foo.txt
-if [ $? -ne 0 ]; then
-	echo cannot objdump main
-	objdump -d main
-	exit 1
-fi
-
-# From the disassembly, get the PCs for foo()'s instructions.
-
-pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
-pc0=`echo $pcs | awk '{print $1}'`
-
 # From the disassembly, get the PCs for USDT probes.
 # Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
 # what sequence of instructions signal a USDT probe.
-- 
2.43.5

