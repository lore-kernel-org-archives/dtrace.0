Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D5F7D40E
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181999; cv=fail; b=B04/SEdAHW7DSD3P2rnHc7Yqc3yqwP9eVAJRpWFuLskv2rBt1kMuxVMB74oQZHW2zi2EaMhYcF2CC9L8Mc0vYp4Faylbw6LXisZNLlUAB7YfmsHrXCnJb/FXgfRlUA1nmUcMSyUugWWSlqjNDCZFkoMsJrDzI8Vg/3IB2/Ap6A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181999; c=relaxed/simple;
	bh=2ZtawZPV8ngy/hMNJWES3fk+y4Hd/JAvGfdiO9QvY+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WqSJTnGQdOxfnX4zeHs8fgVPcE4O0BWcOfFSyP4aqVsBLTl+S/oOrlDPbDqxXfrezUxAE3TxYtgL79ltVrwtiYW1D3FD/fOMZlvB4itauqd2Qpwhasna4uUfXI0holNy2NqI/13mfWLD1sjwDFMOhRe3HbFUETjxZdy4Cwz0yC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VI8lsa025580
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:56 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3DJGfmhplfZRGBdvktzLzzDvJ/5kNI01KJfmuYlBToSng=3D;_b=3D?=
 =?UTF-8?Q?F6cFy9Ox0kLSAhXHlyPRCzbip4lczQa1OJ0hYu+yFud4VHqz2DPUpnOEpd8nu1I?=
 =?UTF-8?Q?vxMep_xxat6L1V/2+E7b9S8Q1C0tt8UBw2ukitxSFTojQWkF18K3SO8HyBmLL2U?=
 =?UTF-8?Q?gX4ToL2DkLI_n/+d5NCgbuKFDqg0uoX/w+s0GiCzWmVBmQkP8v8Lvbei8Slh3xO?=
 =?UTF-8?Q?FhF/WOqirroJVFROL_ATkpViO+1IoH6RnqbuZ0MvFEjV53Hr/pi/nfyJ/IUGlti?=
 =?UTF-8?Q?byonk65iC4bQf2RapZR/QZR_ibaJLJjkyr0lM3/ZWuoNfEEGb/nAkn643coJcer?=
 =?UTF-8?Q?BoyKpkr/5RNi5danP/ce3LTOfZxf7_Lg=3D=3D_?=
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8j8bpyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:56 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIYFYS016544
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:55 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yc50u7var-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXH5Vdaa5H2BkB1VEluPkds+Gkdoe699DdeQLWC1kUhMveB/5Z7gmn1vsDGVzqWuIBrmwuHnT6q8XyTMa/pmDceeoPsAAp+pQsleiLaIG6Sgop+fk/uCXhMvPevqTOpdddLqBIgHQm7mSj6p4LHSabbUdYsOj9dAZxOkcik9unIsLfJtZuhS8qG/Pwf3EwIGGTwvLPnMs7gFFr7fcZaW68xJIWW0t+Rz1WBOrOVQqFiVJCnAJVxFn19H9CUzhVMj+kLzOTJKT8FHpnN4iGpVqnVdLjjFQUdpHUHWjHZYH04OwakpKoB2F6Bij3fx7SIQ32G6HQ9TB2qQJaUkpJMznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGfmhplfZRGBdvktzLzzDvJ/5kNI01KJfmuYlBToSng=;
 b=B4Hz+39/SwyHuv0GxlDT0pNm+4r8YYFObB8RRaYc65HpitCkUKlTHJ4Ls6QxQNHOVZD38LYIsfeCQyQNjNHdz4OWrWLmAVuzlJI++glojOR2MeTLbj3htJgHfdJgn9XGBn6HTN7KOUmRZ4DdOd4hQJsXtU+p/vZcxpwHwMDOFv2Nd7G8WrECnUAsPkGR+/ZMls24kAa2QqIsrjGqqHpjrgFPLp4+8sdbxMgzJcR4zGqeC4t6RvSRFJA91+f/ZCsNfjD1aJXqLo21GZQsfQ3sZvjWRu4bY+xYJqRhpVzfTA3FlPHqDl9zSC4D/QG81H8Y3RvOdazjzPZUn3elTB+Big==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGfmhplfZRGBdvktzLzzDvJ/5kNI01KJfmuYlBToSng=;
 b=wjL16OGpVqDvfaF6xmpqqPYWeuNnNjQ2fIFor7g3AXjljQytSPW3t+rbCXad/rovbAGGDAaud1diTOWl+8JoZWL7i4y986w9tMJ0DDo3JVVQwXPYiEidtyq7TNBOIZIwPvUvVlZQNMo29a2DysVvP098OpGWg9mX29rGWxAUvrg=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:53 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:53 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/9] build: the TESTDIR is relative to the LIBDIR by default
Date: Fri, 31 May 2024 19:59:24 +0100
Message-ID: <20240531185928.363245-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::19) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: c00c436b-2120-4da7-0062-08dc81a3daba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ssU+A2ZluArVoEtOQapN/tV3JRJaDwa/Sw80s0vX4StJfAKKjaj/eTruhPwJ?=
 =?us-ascii?Q?YI4iHof96Q1XdPzK4ild6uVKsOG7vnacwPiM5JuvxjVEJ9m15M887ftkMW+x?=
 =?us-ascii?Q?+n8Zlx5shhMoJgfAKz9heoBC2pshDfkRvq2WXr7gyr7M9CH3ZSsyWPhC8P3x?=
 =?us-ascii?Q?6asfKvkwjpUWZC/viVraiuifMQWdRR8HxpKrj7qt5T9+3t4kyF8K4h9G+1k5?=
 =?us-ascii?Q?MBfylGEh+SlC2xUP8OBSBcJ0zMZ7TIQ0lJAOfskK2aOx0/0hmFVqrjvlhSPN?=
 =?us-ascii?Q?JhzR/qtc+3X3ZBGC78n/yrmnjnF+7bYXVA7nxs5Yb7LQtJdael62NKUcnQjE?=
 =?us-ascii?Q?FRGbU9B2khmtOh75Tlf7nfg+pQikyi3RcSdj6toTLHt1XrdmPEJnGJmU+YXV?=
 =?us-ascii?Q?vIUzbvLg2BvTeYx5E0ngJ8F3ePmPbI5boq/NKs+6lF7B1lTxQe2Zm2RKL507?=
 =?us-ascii?Q?exB0VKwTOXPq7OGjC0PhliLnLsDo4CP0c/ZPpj9VIbeHVsv0vbSSjuQuK0Mp?=
 =?us-ascii?Q?2EzMSO1XBTZgjUSmEkasdNnIlCMaoYo9YTw2dwjVGs/oIr6JABZ6hsLy9L+p?=
 =?us-ascii?Q?P+Tl0QCCNmMOXwMW46gc0Ybw772ww1B5gkAxZ6wIs4yJh/u6xCFzqztmYopF?=
 =?us-ascii?Q?9VxmJMQx5WWcdVkD2ZLuRZrSW68YsRn9LDXoziWYR7h1NeExE4pXzlSb27cs?=
 =?us-ascii?Q?FhcXf4+9iKpQs/0W4EVD7hpkSA0KP0IOyTOFcegOH7lxE2e7J83d5Pi1Sx2h?=
 =?us-ascii?Q?3plqxiyJctuec2CbDj0k4VpI7OsOZNDqNMxGiu3P2GBjFVDNvg0x0o1FtFwL?=
 =?us-ascii?Q?9DT1s6cMWU3XjlmOAOhzQkk5kiLLEYvl9Oq5OyMc4JwjIYSjc4ki/u8M07AJ?=
 =?us-ascii?Q?P/LNw4wiWjTYjY7Ap+/8ghNeydVJ2n7MI+v4B98ZEhY982XEFjwkfZoPxS5H?=
 =?us-ascii?Q?zQd3sqpInczrecTpsE79QD1maHrBnHrdY3UEgV9doOIKhg7W98Kag5+xdwUP?=
 =?us-ascii?Q?K5OBj26nf/HJgSJsxCN+g3aioSUyJ4zyacDwqmZMpZ+5KKFzaNUlv3+HKnJG?=
 =?us-ascii?Q?uLSXwxld1+2iZqzU4KvsIxkiwXpKDvFmHo0dlDFw7nPSzzPNEBpRMccvmejQ?=
 =?us-ascii?Q?NTkyvz/2xuMeh09C7F89cjbG4zbPgcV55KasvSQQZT47m+8DeUQOwXVJFsfi?=
 =?us-ascii?Q?5YBHtQILHP8mDdEejIAE0gMPXc5IEyEOxmymfuITNhUCqz3IWiew2W0i77yo?=
 =?us-ascii?Q?wTbezIGOm53dBfhE4JNlNv0I4M1lpK01P09J0RSH9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i38hNsphHFBH8d3iQwhI/XPG7FcGUoEsseV/2t5qJ/4M0iv+msYFE900UaIF?=
 =?us-ascii?Q?HvnMN76ZJ89rpEzaFfYeRQ3mk8WK0WsKUnxObn/jNETfKj7fIhLtZ9fAx/oN?=
 =?us-ascii?Q?+MSqbDoYgb3d+DeRT/7AZZ689/kboignsMgP32xI/3y3056n9DGA55hTMB6V?=
 =?us-ascii?Q?NSWGTWW7xUzsBj/uADGwJ54jCw7IhPuqROSIELjz0U6qvC3cKpXOKv5ChtaN?=
 =?us-ascii?Q?56H/WKJNd0NDk6ScRedMWsLJd2h/3O/nk4PIROhs5fbtsR8jzR2VqYgA1CST?=
 =?us-ascii?Q?NXgjTFivaCUxBvzLz190eG+9Zmo126coNcX6sy66Kjs5b8dD5v55VFZbK6b4?=
 =?us-ascii?Q?yVm8avM5VGOs4cqMZfirF+B6JsB/vA6wMpWoRoSy0NJwSZJ0MQUkZg5TtjB9?=
 =?us-ascii?Q?nPsOfIvLya07iOMY+02ulQC4x15wBIcsW6Q1LXSjGkGVP+9SOlGwnHKRz0GU?=
 =?us-ascii?Q?oW0ho+Gsojy6QdVe+jHufVCJsC6UoeioK7n5YWxva50ZZBERBnZjsbwYicx9?=
 =?us-ascii?Q?nFCO35T4aNmorb3mEf1d+SxMIvC/R8s8203slyIRwtV2v2/I6JCtfpvJQXCp?=
 =?us-ascii?Q?dnr78D+pZJEOmpGYoRC5VzHizKP8Z4HK95owJCQVj4tv8LB8FuhNOULfL0PL?=
 =?us-ascii?Q?/1hBjY9XKyc9RAp6kTSbf4T8AqBJIK4dv4XsKAjfnMic3L4nP2adpsyPkL0z?=
 =?us-ascii?Q?EuDUYzhqxniZAOvmIMEF4PJxWP3VpdemYFcbH45hnjE3hW8KUPuzFrcDgF+3?=
 =?us-ascii?Q?ONtNGJyX7r5IJOsaTxQTBFKTueJn7nxqy0NsuAtigEGI9UAKc8PuqD+p6npF?=
 =?us-ascii?Q?QloQPRUwdPZEQbe3Wq+TEDV4ADdHi2AWkvk8zQ0RoIV7lNgG1de+u2GdJQMU?=
 =?us-ascii?Q?zQlCF074FprPMuXas7UM8wF/tR3nRzkHMeYnsb3thnv43EOSKyNrf9WwSKY2?=
 =?us-ascii?Q?SP4ifuf4P5YkYD0+qSpy1FMzGSKx9d0Y+ZWuOgbQ1kJarWh3os1IaZFXPkpG?=
 =?us-ascii?Q?Jqtt/8t7irJVPdANCPhaAi129dMsBXPc+kw0DfDb5CDA04hXa0ySEnowRgnE?=
 =?us-ascii?Q?d5ie528RWmeuUW7ZhLAMhYQPkao261J01Jy7ZbQZUUW1ot7G484PYcYUYNFO?=
 =?us-ascii?Q?CiiCRi8LcpP+3789/ozKOs5ZcMamq65g9RvG86Dtm+zEesVEP7+l4P2q1Igq?=
 =?us-ascii?Q?/zQCQncW5jL5jrVgO3mMnO/RakLVVYx5FeIproNmVlwddtiXOnxbzxw51RWe?=
 =?us-ascii?Q?RgbaMybavnkHjlAyhzr/j/qSoqKzAaR/espVT+Te5dcK5kSiiiRssbgvdFXT?=
 =?us-ascii?Q?8dp7+DgXwBIgE+dwlUQm5p3etCGg7f1rY63ss0VxoRIoXnA4HCHveL7PDtaF?=
 =?us-ascii?Q?Ao+84/XlxfmQ2qI5I4/R9M14jI6AutM/ygAsGPP+jrnbcb+lsY0VSQgN0c9M?=
 =?us-ascii?Q?gJqh+5HbzHttwJ6wKBaLI3HKsF0x6tYmFpWH9dLBwhmYRL7QhBje8GUJ9pwY?=
 =?us-ascii?Q?ETwB8/1NLCzaTG9WaIm/KXDeNqxbBGIu2cbO8tNdd/r3B7Ad4Qsd6pMaZK3A?=
 =?us-ascii?Q?YbQ9g7as5MMQrl/lAGlTUbfhn+zljZlBWgNp3oKi8n5hvtPCuT8oWbn3CwXl?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Avyz25hoUJ3L+kLxetWzkuz0/Hk1gsbOQ3dtJzIB+Is0A3nj3jc1wGbufeiSDOweEctMoWPAFczOqPK2zF/JsNoR1M1D7xLllb9XTwTYfsXJsjQ2HpeIWIE36G9bSP9L6036l8AMqURISvT/FomgHB77qyDn+cWPVEUf69Rj/v/yjB/3tuMB2KR35Rm+P9cAgFU1O1pmvT3Mb1DDzAZPuFaAugNxoPHnPTzIAp2r0BFUKWfd02/Qn8JHj83m1EFA+sgn0z5BpAyEuSWjvkTtUrxs8Fe9OD6OX6N0DgY7QrQ1+AsHo4n4xWVLEgUG5TU7ErJ/yi6QuR15/K0oVsginKsnq8lRoDZUZyB963lt3rhAKelaokisjLrfnxNGc7ErvUo8yVxCetsF2rDEwIqLq3HvmwwlmrdKHd6jT64RwNLnBffizQq9j8nzVFDWuH25tcs1RHIDXWRjTSa+PyhopoJHthTSO6o4lItd7/kl5UgKEQB7ZqW2EwwJjpDhbC0GYbwhS2l/cIXlpLPCkMI7SvMfyVpWqZoqK7Z4CUABoW+qb16b1IUs+Dr0hVsq6BLvqjIcfLYK4o+JN3K/kzh2jM9/iULn2u37IZY72mi4twg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00c436b-2120-4da7-0062-08dc81a3daba
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:52.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GipHHP8KFid3tLPJlJgb4qTzfRKSlhpm0NLZi4XR9MsUcmhV+kl3UAhblunnDXdobGN1PfV1/8qrWs6nk0Ylsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-ORIG-GUID: ncNdXKJq1Uoc_evQeTK4GhzUnZP8W84s
X-Proofpoint-GUID: ncNdXKJq1Uoc_evQeTK4GhzUnZP8W84s

If users change the LIBDIR but not the TESTDIR, the TESTDIR
is meant to follow it, but wasn't.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/GNUmakefile b/GNUmakefile
index 5903a8e355f61..e7657d466df50 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -100,7 +100,7 @@ MANDIR = $(prefix)/share/man/man8
 INSTMANDIR = $(DESTDIR)$(MANDIR)
 PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
-TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
+TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 TARGETS =
 
-- 
2.45.1.275.g567cb0950c

