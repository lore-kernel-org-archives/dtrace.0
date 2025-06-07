Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BAE2459DD
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749339898; cv=fail; b=ETOKJ0X2ooPvo7U2gJ9k47LX1ZWXa9eQ2wqWAOb6vqrlZMU6ExbEN3ZFV3UJe+tlJ7em0YRg9EjjRl6gnzeZtxUYOzBDox5fqKVm4rCx4gafS0ynkWaekh6acuMgDNH7aHii4Uma/jy7+DBlT2KqDSCmkuiQQ0CHTaKK/t2CQO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749339898; c=relaxed/simple;
	bh=nQphkspGq+1SAl5JKWO/I61KKWnwxkskTS8gk1yCw6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BZic4NvZwtEthqH/22Fzyv2NXQLo0BGc2JTfVbW5JTGvxDEjVUxNWUxhQRb6BhuU7riGrhGXPA8AfpU5YXWu3vlKkH8vYtiKDO4x9+abRxqbzx70h/8AipNOz+CpUchqZKzQlN/xYt0NOMq2SmQVby0z5Cx8tpPbA+4N8YOsIlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Az6y4g8j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ze184ksC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Az6y4g8j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ze184ksC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557Nib5v013826
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 23:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JibmZA3n7w5ZWnvoZy
	BBuhXUZXJzoMaxjsnxbi5jEbw=; b=Az6y4g8jKLeZxcRyyQnUIvrkQUYnPmX97o
	TnZ0aeLmU2Ln/5eT2sB4h0MivicojeHrj3f0Ecf6FuUbEPed+ZyZaPEEZulafWKd
	tlH71Olh/xSPiPiL1EG467fNElZJf3DAu9cne0NBYbTw4iQiWmy05qHseoY69rbw
	sxLoabiIB5rgaBo57wsOPKB7MR2/FvQ3MJ/rgA+LfDypgfdMXYIneilsYkRUX9Bj
	8hGC5ifVouZuQ5vUncpRjGcVOVzmrd4R9ISaiSic0f6QR5lsF7U24lAXV7vTlRMq
	sMxTEEgGOR68fOeSoadX2OFDAHe8AVgnpdInS+DWajWGz5BOPhwg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad0gny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 23:44:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557IYgl0007435
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 23:44:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv60w7j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 23:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqKvKdfTx85Kc9pnvjBtLhbR1wKPjtlu/4wg254X+LcoNevhGx2ycX7Mrs89IDa09QfJ9F+VVR9U1qMC+coixNChW1UyPI2Tklg0x8oHuNZdlG1B0jcXf3M6+kO5zbq+IpkzD0ytaPI+3yHYpIA7CsziOEkDaplxTl8Owx9erDgemrpLnoS+lbCrwuor/TFjwyfOzedohpF8e1DxBZX53ZYluF64861ykA5ZC/30Vhrsi5bPkKL41nAAH+HdWE2tjJ05itBIwYSPFU8dTqBrBoyGNd5931CZIUGWTu7Ijpl03adp/wLvaaQ0jBgmmHuVkAlUZx76FZwWpHfV0XyTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JibmZA3n7w5ZWnvoZyBBuhXUZXJzoMaxjsnxbi5jEbw=;
 b=yNABfY7n3g9rUreYStR1ul6/FLm8DcleVoe69np+wTvZ+HR9ImHQSYOCTYxEF4qPpxzS8DKo3InCzIRkiBPGT9bbS3DuxlWQidgc8iqyhAeF+/3P14EN2gziPsNmHHc8dgew6ev+UQBTJyUGM+Ri/jDIrURn3dJY2mqegNy5iaezkosH0wFu/amF3WQ7uitxhgODxPoQBqrVbpHsMqcL8X+KQAHxNE0h3BpGJa8tGQFGWEvdXwpP98rvaiissoAwBP3NrqVXdUtPjRYrgGGH1CEEVQ/z7hALMS4UvTACVh4poVegc2AlTRna1/+zDCugDEbej07McRiiD1j3i9VPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JibmZA3n7w5ZWnvoZyBBuhXUZXJzoMaxjsnxbi5jEbw=;
 b=ze184ksCdIurYyJdBtlTjch4nahQIiEaN/X/Yl51w4J/6/asqpzNpVsd7xwKJtXY0PGYgRwEGJz9IbMWxGSTBkBoZcOMzDxQpQV0wSJwaxLaiQHu3tuo0Ta3i0NehLgwzFmlcpHS2MmdY+bR+9i85A9uP8we9FLv4hx9RaA4ahE=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by DS0PR10MB6976.namprd10.prod.outlook.com
 (2603:10b6:8:14b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Sat, 7 Jun
 2025 23:44:52 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8813.024; Sat, 7 Jun 2025
 23:44:51 +0000
Date: Sat, 7 Jun 2025 19:44:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 13/17] dtprobed, usdt parser: add support for ELF
 notes-based USDT
Message-ID: <aETO8OPi3+cbuJxX@oracle.com>
References: <IA4PR10MB8374A6881B0188B5168B375AC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
 <87ecvvjsjq.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecvvjsjq.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|DS0PR10MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cec472-4266-4193-13bf-08dda61d4c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E9Ul6PTXGGgbzrhnZAKFAdSwmsZU+AkkEfBsfHb8RzTDJSF4XuemTGlqI5R1?=
 =?us-ascii?Q?V1BplsAFBg3bHxOVzWuhSknEXfWv6uwqhTVKeD7X3F89qi2lBwf3nE7dg51k?=
 =?us-ascii?Q?EkASNWmbCxeeL+KPGjB1DzH88xvJrtdzGPKsHpozHe+GfjgzTX2/Ln47AZj6?=
 =?us-ascii?Q?sysCJRDawhy++J6ufwEjgqYY5c61JUJx4/I+GpOIS7w90shWG9+zgVJj5D5B?=
 =?us-ascii?Q?IVM8EmT+26uskkX2iwlZp5W2s7m8IiJ/Qvrlms76+Jhh72drG7JI2Bv0bvEo?=
 =?us-ascii?Q?Ivu1S4TlIcaU1l2nDYZcygK6yAiTVsroSlfaHhv9hARf9LgwRoWRTpiTubJ6?=
 =?us-ascii?Q?/lXaXAsVDQAZxUOpQlYXxNsXSENzn92Mf6PfgXPAyBqivQYr4gaf6S1gizEk?=
 =?us-ascii?Q?/JI8YHX6D+aXb3gn2lmT2vXc8U3/8PlwTvy2TbAsg3HSotMo/QUuFDM9l0x5?=
 =?us-ascii?Q?Up1QMQ63rmqlv8d9/lza8rD7SjiW/tnV6juijXgX1APT2it4974H/u1m3tEn?=
 =?us-ascii?Q?sI5ca+afTtx3yIyoWBknI0It97JMxZGIhZMjr66LSlwPojvxtCEGqXMnH0FM?=
 =?us-ascii?Q?gWbHQBrzq1/Ly2qc0h2MCRgW8DkGcuK13Lw5EYlLyViWEF0MlTqleePAlbQI?=
 =?us-ascii?Q?bUETsBzS1/du4Bn1g6zrgU4rn7CC2QaCYZvWNyXrUEV6HK6XDcu6ia7DZzDj?=
 =?us-ascii?Q?YMw4OmwFoUxkT+VxhpC+f2EZ9jQpeDOlF7i2UGUBWqDvcYC7jClBamsV3Ed3?=
 =?us-ascii?Q?mn/wU5s271oopSUS/Zn3FgPPBA+oTj0ebwf901G9RM37/UDI5K1JNzQnAR6G?=
 =?us-ascii?Q?yNafFwQcIRewxBfGk+cHMnE1rEaBP56BN4xZ8NmwNO9P4/zQ/HQ7Vre3x78K?=
 =?us-ascii?Q?j8z+nkt2it/G74+9YhCF5uWF+jdMViP2TS4s5QvKTRdXdKZV++h0af560KlG?=
 =?us-ascii?Q?SsUxnHfiQz5wPQG+8X4dWAZXnwK41N0oPVv5m9fjtxdGblruy8s4E4in6PVT?=
 =?us-ascii?Q?uRp+uGABqMDu4ZaMWCddEW43WecBK/+U1d+zNqiJEmWoeFpLlpSUk/xyYRr8?=
 =?us-ascii?Q?XQigZus9VUxHxfa/RGLrWbQblJ/RVatoTNPxau24h/0ZFivcqOG+Aw1oPotn?=
 =?us-ascii?Q?dt03x6XJVJtESX2H1G4V4SuTcCE2Seb0k5H6Ykt+EtpZGyGjAIhMC6VxIc7Z?=
 =?us-ascii?Q?2eiQBmqcaVGYXoBWiQYy+Ys5RAqaRxGzzlr+tWsHrqeQq1hoS1LXxh6tIxjK?=
 =?us-ascii?Q?eEMWU4LR2l4g1WkmIOinBgTb0njy+IaPI/I3M2gA2N+phk08wnYqbqk8SlYU?=
 =?us-ascii?Q?iN4fH+6XxoJphkwmFi4pDpRG9OCneXnIq3VRe+W/bi5OVJG+Y7LtcQulUssD?=
 =?us-ascii?Q?5lUt/ya/0HU75X3rqlGs6vMnomr4ksb5avb2LUn4zoA73sqQOTUORTE78jLN?=
 =?us-ascii?Q?k4fXh7Zay7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DLBwK/DNvuljzZEBnTlr+vZrrIkJK6UpXRKQFKU/vzpCUMhdOY3At2Vk/JiH?=
 =?us-ascii?Q?lR+lHowbzKEPIhEeatJko2r0PQZ1okuJb8b72tXfKuZYsrAnr2W5XPpf4oan?=
 =?us-ascii?Q?BXJpj1NIiQkI//yx+Rjii2tRLdbFrencGTGw0cRaPHdvWfy1YPLjkOeUUhdx?=
 =?us-ascii?Q?8+hjjwKgz4cZ0dlNUFl5Bg/Xn2D/vjWlDi5d8yXoTCxNz8HtLsS+tnOixtNH?=
 =?us-ascii?Q?m8x2APkGiW6ztgyvGKaewmE2TNkFbb0LHHBtRXU0FZE2ugBOlSbaq2XIX9wp?=
 =?us-ascii?Q?9eHkeGuntVjjgtFEwtkrDkyIWj6U+JNODapRuHP2MRx5FKYXMmG5RCblQ+wr?=
 =?us-ascii?Q?VytMLM9LgZWIAG6CUjWrxc/VR5rVrJd7bnSA/2hVlJYNtVVjU+TytfHOk1hd?=
 =?us-ascii?Q?v9Iru9JheUh+ofl55LVqBO1q41rN8IuaDrvxRWW8TtFzVYMoSAkqYau3dVaL?=
 =?us-ascii?Q?2mca1D46TmaAOOk2PvF+f+a7H0rhszWHgPDUGYWG0h94e6fpPFdogrtiTttv?=
 =?us-ascii?Q?1ZfZvph+FZRP3T5AnEYwcT1awoVEycmzz10PbkOJaTXfcYpSs6rLBEsA9rp3?=
 =?us-ascii?Q?YmwHnl9xZI4yI8pU7uysHvVCBjdNnI3pVpUZH3TgVXdMQaRKENk2ouuADjJl?=
 =?us-ascii?Q?MNtcD3nfOVnx0glWgy8OKq3eVpONhMGOPAPKtJWx/tM2tqmGk3yUc/bZkSao?=
 =?us-ascii?Q?Z2aMatJXw8rPkV15StuAyEWy2sy/EGpKc8YJ1bG62tQ5vHfyOK+LmjCtqCLv?=
 =?us-ascii?Q?claoihkIreZ932j2yO0kyP0+ZPvxKeSK3+T6ObQwMDbP9//DdgXotwU9wKSJ?=
 =?us-ascii?Q?4DP/PTvTG+twZIu2MrXxCPc4HgBo8pWzQAEwOlPAb6HM4Zj9KikIK1ee93eq?=
 =?us-ascii?Q?Ljf49o95bcBfHfTzi0+tuhk4uX034+OoTiTyEa1gwWNYJJOIhbpuYclC4SFB?=
 =?us-ascii?Q?tXSSQmnqn9Xy8aLuGcA6awiJajNOIDb7jWL456k+Ig27fCgJt1Eu39CcoXW+?=
 =?us-ascii?Q?DXq7LMI39OxVUX3ztwfvv3/8Dj02rF+cFcFPCaAn8AIUlsbhFgelA7d/XnQU?=
 =?us-ascii?Q?r6I/+4pT7s8Lu6K26XgO52XHHASODA3n1Nl2Ggop8nfBkfFcCuPacE0S23KL?=
 =?us-ascii?Q?cu6sKx0aNKMgih1TYUdKa6soSYNywsSf5fEKrs8FFjTgAaCAhrBpYUOqXbQ4?=
 =?us-ascii?Q?6TQ4XwTpd8kB7CIWpPzDGSiMb8iJdG3zSY9BPtJxMhqdgNmFxhFYQ3wpKkhB?=
 =?us-ascii?Q?44Au56q77vVkvXreoLnkawTpemDhyu3G/RfE1eTIlHREySjr2TecIcVSD+sB?=
 =?us-ascii?Q?8cOk4jW4uzuIEpgWWKgAirci9yGZdTmqLhZ45lTJdzMkmpOyj8lvUmTkyN0F?=
 =?us-ascii?Q?xhKJPqlOniOmKWMlgIiI7TKRd3xfyT7EsawQCKxx67asWQTOUUI5iQULHixR?=
 =?us-ascii?Q?pfrV++mIy9lTluIDKMRDb/SDSwI1eJc/0qF7zRXLYgtDW+/F8YNQVZF0PLdH?=
 =?us-ascii?Q?/jUq/jp6/WtHJHNsX+oRc6/JqSZWo/2K5oDv5wRnj0UIOfEhu5xgjzzXIsJF?=
 =?us-ascii?Q?EAttCOLtMXtJK8LxhICOmo2xsaHszOVjWO89gpXuo6f7/mlUeGGJ4VRSthXf?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Uq9/eksr+ZUwdA5jHTX8hXyo1kCCjPta78JjM/aVxH+NoC/04keb4YTvsqJgCtV18mZNes+QzC0ugkEemfCF7ZbqnlPFyAlb2nTUP0C5jcUhEBo8yAmFD2jR1PuIZEXa1flNDqUg4xEg9ZT+YlIFRQuC2GNszzWaC7voeUMUwsEHj38NGvLSCExWbIW3TMxQWAYvY5rak0zQyRZbU610/4exAut6haPog13EDDNF6rpXjQ5ISHLNhai5ZISASoEzyuta8bHo5ShfNJ7dkIgh7c9Koz/C2/E7D+Y9IaapqTeh8QM2VJwqElRzURy1BAqhI6r0ROqpzLp1RWSMhv0mcfvtDNz+Qusj/vN50E6+1wZTPPOz+l12/TX/wZBViwDJ2UFFF9D6CSOTNz2SJTQHemle40fNC9VmqA/tXAiL1u1nHI5Ea2WyqGupdQB3fpzEzC73EZzpNa6fkKOSJ3sqgzcr5iTvPLgK+X13nURpW32NmH5wsBhsgE61tagHTGd7yNYgYtOPTITNpAWZ+L41dk0V7mZSChpf/lLFbc+w5a1c1EVkzpu2SXfdTvAt9emfin+cFw1MSKLBKWCApNAHX1B1o3O0Iu3BdV5x0seoZx0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cec472-4266-4193-13bf-08dda61d4c13
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 23:44:51.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDUfdVFG2uhk9cVadFj9YLjWLi0NNxviSTjpOB8c3vs3pwNlHtlfjWHoMM2N6z7OqDKredg0UKAndzpdZLADiu8kCUqbHdGTt77xZMdkdto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6976
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_10,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070174
X-Proofpoint-ORIG-GUID: ZPmAPmNGLF0JRYhpCjPoEp2fdqgJDmCK
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6844cef7 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=P3o2y8Idih9G6obBtiAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE3NCBTYWx0ZWRfX19eqDPUn4v56 zY5t8dhHpQXtDFpLgZNwBRxH6vYLIS2GCrN4JWH1UvKM3uhi/c6bMl5ibgRmwAq/0FJbGDPn9YE Vg2jvjn/+L03qBD8XlLo1ciAa487KhIDB1STp4ZLDOq3m7bPTNLV3f/fNjKfogPK7teHzrzn+OV
 JSXhzSr60gMCk1l1vskqgOmR0xUS+DCj+TIYDhJz0Nkpx/Bn90QHQXA5P5wiycekdvYQTmqwImB uCSLBBOlBhvycRYUsL/mHjM3QVvCtA/pvAlr6R3iNAQ0QQAy5iyDwViY5huPcW0UaN/IG00bfwi C4eAdFLE1xLdIl64LsnzqBCoVolwJxT/rMAevMGovKGkX9/oDvD1THpt4XZmuRfuhZsAVv+eOyG
 O+XleYGFXdJ9sOSW1d+Bj+LPSs0pTglTliQUuh0LQiiMAl5WqQ8jxI++ikPo5VlMpRhL2DCF
X-Proofpoint-GUID: ZPmAPmNGLF0JRYhpCjPoEp2fdqgJDmCK

On Sat, Jun 07, 2025 at 07:49:29PM +0100, Nick Alcock wrote:
> On 7 Jun 2025, Kris Van Hees verbalised:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Thanks.

> Modulo this piece of utter pedantry:
> 
> > +	 *   rc = 1: All blocks written successfully.
> > +	 *   rc = 0: Some blocks not written.
> > +	 *   rc = -1: An erorr happened (some blocks not written).
> 
> Erorr is an erorr!

Thanks.

> > +		if (prp->fun != NULL) {
> > +			ptp->next = prp->next;
> > +			ptp->nargc = prp->nargc;
> > +			ptp->nargs = prp->nargs;
> > +			ptp->nargsz = prp->nargsz;
> > +			ptp->xargc = prp->xargc;
> > +			ptp->xargs = prp->xargs;
> > +			ptp->xargsz = prp->xargsz;
> > +			ptp->xmap = prp->xmap;
> > +			prp->next = ptp;
> > +			prp->ntp++;
> > +		} else {
> > +			dt_htab_delete(prbmap, ptp);
> > +			dt_htab_insert(pvp->pmap, ptp);
> > +			ptp->ntp = 1;
> > +			ptp->nargc = prp->nargc;
> > +			ptp->nargs = prp->nargs;
> > +			ptp->nargsz = prp->nargsz;
> > +			ptp->xargc = prp->xargc;
> > +			ptp->xargs = prp->xargs;
> > +			ptp->xargsz = prp->xargsz;
> > +			ptp->xmap = prp->xmap;
> > +			pvp->probec++;
> > +		}
> > +	}
> > +
> > +prvit = NULL;
> > +while ((pvp = dt_htab_next(prvmap, &prvit)) != NULL) {
> > +  dt_htab_next_t	*prbit = NULL;
> > +  dt_probe_t		*prp;
> > +
> > +  dt_dbg_usdt("    Provider '%s' with %d probe%s:\n", pvp->name, pvp->probec, pvp->probec == 1 ? "" : "s");
> > +  while ((prp = dt_htab_next(pvp->pmap, &prbit)) != NULL) {
> > +    dt_dbg_usdt("      Probe %s:%s:%s:%s (off %x)\n", prp->prv, prp->mod, prp->fun ? prp->fun : "", prp->prb, prp->fun ? prp->off : -1);
> > +    while ((prp = prp->next) != NULL)
> > +      dt_dbg_usdt("        Probe %s:%s:%s:%s (off %x)\n", prp->prv, prp->mod, prp->fun ? prp->fun : "", prp->prb, prp->fun ? prp->off : -1);
> > +  }
> > +}
> > +
> > +	/* Emit any provider that has tracepoints. */
> > +	prvit = NULL;
> > +	while ((pvp = dt_htab_next(prvmap, &prvit)) != NULL) {
> > +		if (pvp->probec > 0 && emit_provider(out, dhp, pvp) == -1)
> > +			goto err;
> > +	}
> > +
> > +	goto out;
> 
> Going by the indentation, the outdented bit looks like debugging code
> you either forgot to remove, or forgot to reindent :)

Ah yes, thanks.
