Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1021D14FA
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890605; cv=fail; b=kG21zBWNYOjM+/Lw7Mvr/brbWroAaO7yMyDqJYUphFCcA95C1q+WIp9+TFd1GVSyXNYi0Xkb+Vkr+Rofl9yxDss+p6crINkarEEkIhSDHPSzMlQX7o/U3TsgvujfWp5OLtJ5j02Fs6rpAK9NFCExe67DGutaR9aluycRQI/y4uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890605; c=relaxed/simple;
	bh=RmiKn9Pg5nQRrOvqGyyO0fca4pm0BqmrHpefuBs3w0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gezeHchAoGWKA4FBM0ldE17QY26ZfA8gG4eW81femrpltC7V7SlW84TSb7q1Ptk2CwZB+0LH2VEeVbKPunVj+U33TxwphYbaekFf6T9ynhXKahFMq7K6Q5AnXlWMPh1vvkzp3wT+RAN98amyguPzvWtnrzy7RTHoQjQRfdJ7KOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gRobcNye; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OLeGQnPv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gRobcNye";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OLeGQnPv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJde5g010359
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=/LhQIhKA+3bHbFK2Tk
	RcaWDXOXdGedRZwbC5uXp9jcQ=; b=gRobcNyeFCWHChiGxF6zYVbIg0ZCWYHHeX
	+kwc+iLLA6xB9SAjT3M0fij3D351feEy7mdzVgG918O/uCCr8BQkVhxCzY1NhN9h
	hNts4ALJroJdA9l8o5nmgWO9gHo4e7czo5RMhK9L0HtGqX05ZCA6nFXMFiMy/bN1
	TLbYP6/jAqIdtz05a9IrPjyewMhiKrxoWTMaXFEI+Q0bDGh94yVdejRu7kJXT8vz
	1+OUk++rCMp9efhdbsE7OXHvFd39QeTqit2A2KcauUTU4rfULD3TSMF1qttWebTu
	3v/fSM0PlRONpIGitCNOtWD4TslWnP/XBBk8jyq4zhptDaW0ZqSg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v5x6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:10:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PK3t8q036721
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:10:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5t5xd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkH0JTryH87UxIZ5bsC734v0MP2D1MLSctWhs/rrpXqDBAx5M9Ff37QSsiMNbwzj7TiNfBjJEI3UakCqlNDlBVAqcUAvSJYr+9LyqyfXze4R9yaAW+2J42QsOJOFO+L9jvp1KEPTlY+KxXN5xjrTPK1Q9sx/OEdVdo01SKIcDQ+qnJhi+GR4j8P1ipEkaOvMOFBTf54snZBhN3CYCK4MlBSI6bTKyFy8SQe7GFuD6Ybctiu/opbbr/19t34VrJJRF4vCrlNYR6lA1t3TaRomHboc3R6aeOfzP38Vra0eA6voxFqk0Tkde3FrXyN+SJPMMRvBmta3kMDTC0QvGZrTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LhQIhKA+3bHbFK2TkRcaWDXOXdGedRZwbC5uXp9jcQ=;
 b=h90DJCAeNy5mYHBSBf7NvnjUIfwKzoZVFh5d1rwVQnVivhg1sRFody3chGrjMxABoBavWl6h1FO+2FTNQMZjlo1JJEnhz6n85t+YoU5FPgXTY2nLMLyveq5EMjCx6Qy+c6jjxZJkVV/yU2j6CJW9eMJ6QHWdo635wRQQ8659Yhl6zE8l+ews/nEDtV/S3bl4LUN0Lzh6as6Dogy1uaHG8mCPfU7NJoRXDy98KNjbI6a2x2mbugnTnK4EbINj7Q/dyGVgsQLmqIo5bUyVA8FHvVlxqJfUOj3YB5e5yLAtmsQ/rgHumLGg75ZosE87I+aS6DerHF/SxvZ+EjXDd5PlpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LhQIhKA+3bHbFK2TkRcaWDXOXdGedRZwbC5uXp9jcQ=;
 b=OLeGQnPvYenQhe7+W2P5Af0Hdu2/x1IH6RJqG0xS6V1+uCjAQrBPg3yT5oL1heIcsetU11MVavebRg4aUmnyKv4gmmq8AXHYwwUY2B0zJh3e64kfkiyGER6V9SZG0c18tZ7R6exY0mr/ShQDiBYZYx/+wjTlUSEazuZAbnuPR0c=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB8199.namprd10.prod.outlook.com (2603:10b6:8:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Fri, 25 Oct
 2024 21:09:58 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 21:09:58 +0000
Date: Fri, 25 Oct 2024 17:09:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] test: Do not return 1 for err.*.x checks
Message-ID: <ZxwJJMdYlTXFBtjZ@kvh-deb-bpf.us.oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
 <20241004044355.25870-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004044355.25870-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:74::42) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65c1e0-8d00-4665-2f2b-08dcf539619d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4YINdfixNJuQGUSCpRYVJ3xxoX2TS2g20/h+K79+5+4goZP3aWchtZN6qhwA?=
 =?us-ascii?Q?NNU+T4jrEx7Qs+4A5s1zuRvLcQec5nCpXTJtflllcqcCe8mq31OKQkpTZ98I?=
 =?us-ascii?Q?fI13MuSqQns1HNxpjaxJULe30LebO2Wa5fhUQFP1SQoEx4RBxazGLUSv5DXK?=
 =?us-ascii?Q?weBvWa/8LLgiX3kJN6gTQeNeiUP6QU+R9NbT9uUd2mYLh0K9LN6kZ8c5BOT6?=
 =?us-ascii?Q?5xtlX7kZkAw8eEIOu/jDCPG++lB5eJ3lLP3BMigtpdO7PDmdrctT//tTboM5?=
 =?us-ascii?Q?0x6Z3yc+hpFQQGwmJlf0lQQML3CgRnOVtzsxAweZ56MFfm2JsAzE5/cV/WAE?=
 =?us-ascii?Q?4p6HdX+8xOemiTj4Xn/mmmIrGjza8J+Ixzieq44v1f7g/ObE4xim8bv8ZNwH?=
 =?us-ascii?Q?TuyEmtHSBzg3frhvDcM0+s9EwRRukcBKGhwg7wzkCcvDpl7G1u7Cepd33Fbe?=
 =?us-ascii?Q?AaFRxTAcsx5wQtwpUhFHFMIgj1xI1vPD/zUpk5e6O1wig9GSMe9mWblWu1KX?=
 =?us-ascii?Q?d5OXZzcAnrWnQ6UfRaP5BDyuRYbLOHMrMY9TUS++lxm4GHrlTASdQDw4wX1+?=
 =?us-ascii?Q?nKqOorEUtDumhGd3z6dd/0uN6bUOc9WCqnr1ZNYCLBCkKIDfwqORvvpkzNF5?=
 =?us-ascii?Q?vplcGd+fZtus+396tSOMxyXIxVycUc9ZgLJA6pvzt+HEBOnKLrqvQ3XQTLoS?=
 =?us-ascii?Q?QuHyo0z9nxmVjcmXYp9+wgJQSD2KtXVSCQQ1gRsp6BRxGJSW+40oX7MV6UOo?=
 =?us-ascii?Q?67q8QqEinSDVbmekQzAHWHcad2FRh7UGtwR8aZL/cUSyyeG9LpFr5hBPXVDt?=
 =?us-ascii?Q?Uhf9Q9ZP6A6uTOq0ogxC/hCII586QLwhUV0WQ7K9HtUrtLJfn70mCIEX0WtT?=
 =?us-ascii?Q?fL4Qq66qbSxtrI8tqBjeaSZPRZaqTzrpWiLPfJqdwM5R8PYUTr4R1J9zQmQQ?=
 =?us-ascii?Q?yjiR0TGsEfgoVSOD+zxsu9C8Gues1gQMNqHlvEMk3YULfo07lpIIVVlwzXQH?=
 =?us-ascii?Q?bJ9IOw8wKyza8gwFlsI0ODbuUopJMHs7UBrD4NdAgM8zWHAjeBKn8EAze3fB?=
 =?us-ascii?Q?ddQA7MupnUbsNRFX8ZQcrUkVeutzDehhhTUpH+NuvE3Rt8IUdHSCYQIDn5LP?=
 =?us-ascii?Q?upZC5+JLhm9k4xCYeBIjDtoD4WwZV/X4PkttAQN8JS7hp+7VeF1PjhBgkkrm?=
 =?us-ascii?Q?DcvrqYLSsxLXW3Q/s36Q3cJ53rfPU3a7gOVNwJ4H1y9od3OmFkFUQSUUubvp?=
 =?us-ascii?Q?HO1C2UfzRmIJwe0cd/CaR3S1ARUHXTUU2tBk2HHx5mb7X0fBAKgQJjDwOV+z?=
 =?us-ascii?Q?3KSxq2Pjkn+fAlihSHBqRbUl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kGRNeY8oNS09TY+C9rQZnegOog16/IZpvMMejrNzL8K8rhWrcmku5Vj4VGuK?=
 =?us-ascii?Q?c0cpHI0cMgAIisNuFOt45ZI6IcQsgoDPWde/m2OZaHYRT6rpMxCHIpSBnNSt?=
 =?us-ascii?Q?OMQ3uqTJhTo96VLZX8PeCkANTPf7sK2co5dyPnR5X2FZGPvlBeRi2opU+PSO?=
 =?us-ascii?Q?uCbKTly5xJW/AVBPKMgIMohzjiiXYaozyzjv95+6ekh23MLf1RTyfDfyMKeq?=
 =?us-ascii?Q?QrGvzfn14PoaMRDBCHzT7vk45+oIawFRX1xGstofH6gzz2MAmfw9I+RIEAKR?=
 =?us-ascii?Q?6T8MYR5zQWTYRpGLQ4/uzUWcOm/DXgcFT+Qew45hP6syiabd3IsccL4B6aMd?=
 =?us-ascii?Q?4ZK2b2T2Fzs0/zZQybtFGVTkFeMi4RPZ1gSVujBvGWfzvG27ugFT3ghq0E0E?=
 =?us-ascii?Q?AKc3+ypYvCwxphRQLZwgR9wKD1L2uPk9uBu4xGPb/GB46wjRpc63OvLO5ZSa?=
 =?us-ascii?Q?pIn1KrKnPaefQNBfpVSssJZrgELJdHxDHcGDFrne+leOlAlKynusO6USUlsT?=
 =?us-ascii?Q?vSdJH4zTxXYw6IcLn82atOnb7hfa1w6f5OeTXrcOTS34ABzwApsxRcY+N3EW?=
 =?us-ascii?Q?rwadh2WmFYhsAPanesUzcIj/HmOr43ZbtjUlgn+P/XC0NUS/IhI5EhfS0pF4?=
 =?us-ascii?Q?PS6pbvIvWhAuLqss71Rj9rhu/n97oFpVlnlnx3pIvJKDDRd2ECs4lJQ8q88n?=
 =?us-ascii?Q?ZOngAcR82YGUbaR3q5Q1U4DXcFIaP1I6jJxf7KQ2bUyPkj1PrPAuTuqTqxP8?=
 =?us-ascii?Q?PaRuvT1z4uHwbrJchdD6NWOujgZavEs65wSBJ4lyWX2wbIlLo+llJxIAwf73?=
 =?us-ascii?Q?tKbK6bJIOKH+4Il1FnMN1imA9fZj+og5pCIL+VaUoK+QtG+fX64NUO9J/BSh?=
 =?us-ascii?Q?ltfzn8TJaBFIGu5SFuTXcZkMrRv8E3TWGrfRY7voYShShMKDxO6A4ppLJYHB?=
 =?us-ascii?Q?6/6qN7pg+3wrVVkFLzLsOks0yNyMBKb1O7HOwPBqVLxc8JEWcx9jMf9/lTAZ?=
 =?us-ascii?Q?kOwys6IQXL3lNZx4COUp4s8E+0sCB5tds+K+fLnnIpOPI1JjUyi2wgJ2rhUR?=
 =?us-ascii?Q?Xy+rGlQPwSqM0+O30GBSB1SzOxF6nXaNuNN4n5lFvxp126FuLhQ/KSrZDv/2?=
 =?us-ascii?Q?YfcnzUanGtyeyh6zW8Rz8u9nno6nBjfgzc6eo+W1VjxNRiK+HqSooGeEoJJf?=
 =?us-ascii?Q?MvVrH4q30PpgB48WRZ3qBNo87bFlSIXg2EavkFkMWPSne9MDZcVFDmclgjZq?=
 =?us-ascii?Q?aOXedVaj7w+8pYvdI7kjo7Al+p9twd66XHZr+Cv8+c2PHTsDYFEOv3CbvwZq?=
 =?us-ascii?Q?dq+EmJItKVFAO8PFdQsfrtG6EECBD4gB7IscEmzqIv08gf7bm5Vyu5gpQAPJ?=
 =?us-ascii?Q?KSGEvF/TeB9GlXnWjXmntVKbfUDQkvsFuQkncgZ+YK5cUhgSBNEbODJpNbq2?=
 =?us-ascii?Q?FwDsk3GLv8MqzTEtAlBh3l/ueYfPhBYLgjq9wXyV4T0fb+9f6z+okNH5tVuJ?=
 =?us-ascii?Q?dYo5Uxs6i4v4ivyV1y2BTFUGyvl5Q/EZADpZd0MHhkQjc9bqFuHc+E8/cZNS?=
 =?us-ascii?Q?QsIAzqWYn0HC3jLyb0H0TU0d5D9kAjVAQfQ6X4A9ze1kNzrSJDXvqAhdH+wr?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RFIBEZphdDG8n35gH/mcmimYqnjO8nC8SCpc1/5fttmIn5/3J8PP6021W5lFgV50J0NBwhOpeYL5G+VnTdA536QRHqK8VWekgJUtoJ101jNlbP79O03tg7+kSKZzkclR65j2KXw9dkvb0+SeJpZYYBk9tJwMcGn71PR5Tdz3vW2svw88Qzk0N44OdCnI+B1o0tHuWAKtaDZQ0KTh+zMlA98qtbG85G1mjGEcSaJH2jd2Oe36ySKUxBahxGX5tgA0pS0U3zL6Qh9yiPPjZjIckrlr2CY1PrnogtMZaqu4+c0XjcKz+ZT+kpVpzOOYe5ySG4AGfL1/pF8pHkd0jgXJMNTEuEqK3rWylgitWf0dM1WSoldpBKTLHXKl5NuC1IyvwCN18QhW0VRXPQD6PVwglLZJAm4VlZVlllVWVtuJnPp5E5sZln2C7xd305v9htNezPw72v7TcLRqSbvFbOYonnSHMTGG6Fh7gItL+Iqd6BYI5u3WPI2zBT06w7kqk0DCC6cQOc+E2Eayety58ZyDCipTrXr632ft0YkWO9ujBZrX5EAtUlaH195TnW7BGKvPM+Jxk/3O6XPiUkbuGp+q9JFvC3FAcTabBLG33kk+sw8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65c1e0-8d00-4665-2f2b-08dcf539619d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:09:58.0208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5w8QGB7mEpXwuUIFa/ee2cO5srtM/nNqsVAcIeghwofTtJuztZrKbM2TDcweNLMI8muOT9uAa93kcbjFsUn/UoWw+lTqceZnjy7V9GWbKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250163
X-Proofpoint-GUID: iH1_cenibg7VDyTVseKSK6lIvns2RRUy
X-Proofpoint-ORIG-GUID: iH1_cenibg7VDyTVseKSK6lIvns2RRUy

On Fri, Oct 04, 2024 at 12:43:54AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> We can mark tests as expected to fail.  In fact, with .x files,
> we can mark XFAIL based on a runtime check.
> 
> For err.* tests, however, we are expected to fail anyhow.  So,
> having an err.*.x return 1 is at least confusing... certainly
> for the runtest.sh script.
> 
> In practice, err.*.x files usually return only 0 or 2 -- that is,
> we might elect to skip the test.
> 
> The sole exception is err.unloaded_var.x, which checks for
> /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko*.  If this module
> is missing, the test is supposed to fail, but as it is err.* it is
> expected to fail anyhow.  So the counterintuitive result is that
> if the module is missing, the test produces XPASS.
> 
> Change this err.*.x file to skip the test if the module is missing.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/types/err.unloaded_var.x | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/types/err.unloaded_var.x b/test/unittest/types/err.unloaded_var.x
> index 54c61d57d..cc63265a4 100755
> --- a/test/unittest/types/err.unloaded_var.x
> +++ b/test/unittest/types/err.unloaded_var.x
> @@ -2,7 +2,7 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# XFAIL if gfs2.ko not found (exit 1)
> +# SKIP if gfs2.ko not found (exit 2)
>  [[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko ]] &&
> -[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko.xz ]] && exit 1;
> +[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko.xz ]] && exit 2;
>  exit 0
> -- 
> 2.43.5
> 
