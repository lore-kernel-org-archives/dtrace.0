Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF71801
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765197; cv=fail; b=QLBA6aXMxVPTyKY2Ukn+C6DwHmXuydTiFbSsjcHGFLdjTOf34r8RzwLd2M8v2ZDDdE0NiQK2foTJkihfPrLBssR/U7HPe7yxzxAFk+8l+Q3abF42cCjx1zv14ijbL1Lebx1x9meWmtUbkCt/AMSpb/qnd/KftENzSW6KWGHSjs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765197; c=relaxed/simple;
	bh=bTiuPvmF5johBK+nAPKqXs/vPUULEFf+Fy95WX0L/6o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GKdVETcq/ZScP3TgXaTgh5LKrLIGPM6Ad0aTbyD2ANXncX9AVKq5BEZJDsfQHgQHPutWyWK5yuVEIqKkJU1S4kl6UDeT2np5hOJkdMzcj2YX1A5PJA63IFg8eKv7th5QowyqZ4RYc5Tf+ieJ1Rm151QCgteidbN1ruRGG85LKTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YwoIRQEj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uPk7Ts2F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YwoIRQEj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uPk7Ts2F"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Lh8jr025764
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=GZfZw9T+E1924qkaZXiTNU7rm0E8zrCFEjhNd/hskYo=; b=
	YwoIRQEj6CZHAfVuFe9PYn8qSRzvdq3B/Kyaxt2E02Ve999OKuyYdw9DFhhjCz65
	NmscN+HwyQVIIYxhE/vMLl2iI8pbc3pF+0/oLlSITYVFUQtrlZE6oi1KgGUTJhUH
	ISMczv5ywlswHkb9wVVZcB2z07uBGklaAEwaODqaQl9WhpiQ2NUkMCJmTXIy+kMX
	HkLgSA8lUv9OdkhwPQH+x2ugECMQT87TUv+8+d6++zBs7lYNyjAtaDaxvPTR0ueE
	8XmWDSsuNBrMQwUNA6Asnfxu3X3D6B8SaQbccFXquND1MBMPoUxDT6Kai2BoJpXr
	/x5drgXvDbj5DepGNAuKVA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nby8v2ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MVwaA009833
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahcrhne-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAZZ41bbFl0axT2tI2mawvOL59jBirxxNgxQf98CaesPE/eDxPCTyq+sP3TjiY6vxCIqiunSNBEijHSGtvUEGc+/vpwHXcmgJNTl8rAZIo6NGTHbCoO9ljWpgtp06t2MUkMdCD/vVG12yC3YagiVu/zbiCYT/Pi1OUU3tXtAeFUeCfyLbK8HWJ0dYMPCD5jmFxhFvLx9uPfz+dA42DJYqt7GsJxHhaJ8JFoGsIFPSuUg623/s7JrUSmtRlb2WiwAAFgVJlHxdrp+GJFx4Eo+0SNMbO3mF1BemgGU6ECHRqEuf1qR3ah1S+fmE88y6R8H5yZOurUfzZOSGJk755HsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZfZw9T+E1924qkaZXiTNU7rm0E8zrCFEjhNd/hskYo=;
 b=X1j32OR8LhPyLhCUrLqL8NhoGrf98tDzFr1Kyv3CV6HWG+jEWlFpJE/a8zWPCe8ec4I0xjlOPi1RbwOzc1yKFX4ZUwuCGo655uLH0bRxLKzcthuQfC9sNozMCmqPqjKTjkJQiRunaRr8KCAXW7QhPGNu/WDzELIYAcMQJYVwk7Q3Ng3gWnq58qLkiq6FJYnq2Xpl0ZqiSOm82TDII5Ox6YOuqRTWCZqYVBKsNz2L/s6/5Tb0y/j0ISeKqhkczQNTmdzKpXyCqwSI44ZO9/iIpFwNsDbALhWmQ87wyGtVzrnn9iIYB7/Q2PxHSshEZgcWsOrSYEPNgqddGTc4+22IHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZfZw9T+E1924qkaZXiTNU7rm0E8zrCFEjhNd/hskYo=;
 b=uPk7Ts2F2e2bZQlF89SHgdp3D3Yj2DD4fwywYRiuCKCl/DWaMgAIrezzh09o0Bw1oXqGU3IAzQjWaOcljITAk7oHfI1AzO5M2BdiYRNilLcwXMixCrtYehAAXlHL+PC6yB3d2MxmsuRDRCMEob4u7mnfffoKfNym/JzRjmXV3d0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:21 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:21 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 3/6] cg: add argument mapping in the trampoline
Date: Tue,  5 Nov 2024 00:06:05 +0000
Message-ID: <20241105000608.333229-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105000608.333229-1-nick.alcock@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0213.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::33) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1b574a-1e93-4b59-1a75-08dcfd2dad9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z9qC3wGlwu16iy8z6LvPrNYIbUCvr+MlMU5tC81Lnj4ykSyGY3QnZqsyMOmX?=
 =?us-ascii?Q?zobj4q/XuOByc59f0fcWJfNYi3vSU+sjM+7laTF5Rr293a8P7kjdClIlv7Fz?=
 =?us-ascii?Q?xHjzr4WXkdBtAke6qLJ3evW3sYB1s4d24qkCO7EsVKzv/htKWZytIXCv+H4p?=
 =?us-ascii?Q?WGSV/B0lDfp+Jwd4ZEERTgzOKKAhOeobbmJRbcn3wFg7lT/J+H7YjoVibws8?=
 =?us-ascii?Q?cmfUT7o9oUQHhW/WYlOjlC6Bs8XPDdM20hIiYo1O96fbfM0SI4sqvm3unqPr?=
 =?us-ascii?Q?94fGNQnhdtvD4LfqCpHXgt9hXJRa4YF/vbedIUksrnhau2SI3hzPn7g25tJQ?=
 =?us-ascii?Q?SObtXExTi7vYTqpQtfev7fe84NzVz4pX8WUXOgUfOVxXtu2BrPnH2vR8Fvo+?=
 =?us-ascii?Q?kT8xxKALjAwAmgKJHLXKiiAUc6ExtnSQprOIGJz7Mby+VGjEBsxx1rbZvv/z?=
 =?us-ascii?Q?NN2voW30Oin08PiIBcnrpn1QO+LJjbQpMoB0rH5rChL/lPO2urXE/WJpM1Lj?=
 =?us-ascii?Q?X0lGvWexfeshzWF+2Klqz3uZjcwWuc90FlGnYo7A9XmAUb/a9y3KgEPzsnCN?=
 =?us-ascii?Q?5dbrMai+AgZsgCD/Z47MDTDgtpg1ZIqjYcsdLmsPWb2DgQ8TpH3Bt02stmnI?=
 =?us-ascii?Q?faXDpyEaOgkH3auxdaFDDiMUa3UIb8obGSSBixzXYs49J6b9LqbXxeWYfPYe?=
 =?us-ascii?Q?HR+xy8vSorh7t8bW0aZD8l0JxUTZzGjWq7izVbl6nmZV9/1fsbvLwarxaav2?=
 =?us-ascii?Q?nL9EVfWDAiFEhznpOdIl6Ta4fPkV4oxuX/CM+Nz+ziKzAZwoDGhqUdYXvBis?=
 =?us-ascii?Q?GYru0HmIPABQjWgvbOjwL0zg5wsDLMbjPSdO73RX4nCpRw2Rn+XEQs4NwF5P?=
 =?us-ascii?Q?62+GsgrVwlI8hzzwsSSh1T0MZdcDxkgfyP/WR+sUAq58hlcrh6iRab0A42C9?=
 =?us-ascii?Q?1Yk/xlejvWpgPCJFUdm82rfw/npgW+xhFiL1tfxYyeW1GHraT8ouvqeAfCCP?=
 =?us-ascii?Q?QztOnANI6MOkxtWuo9o62qMuYtK+aWlsWY+xKRWRkrHPVhmkELXLZQaum92d?=
 =?us-ascii?Q?Tm7L4Xl1jnupfCAbGE2lp8k7jJh0iKzdSNP71KwQ9a9NPqZL2JH7QA+9YbUt?=
 =?us-ascii?Q?QVMalYaVCFvRdtlmAuV6nKVPLUKyBkkTUySnXKFJyCdi3WghtS0sl6MgcfK+?=
 =?us-ascii?Q?3nu88SGeLPRTt8HvuKZWBTUU2aMmAHWxJPp1YtzKLeNQbVR2vjHb2CSubxhd?=
 =?us-ascii?Q?GEu6Do00++pebfCxAU6qhy7JhIGBLoHS00MK1mnNZAnXN07OlMKRjGskVXm8?=
 =?us-ascii?Q?gaZJ+XQUHvCui3gAcjMPAR9f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LVo3fm5VJd4e891+fVpmeeoP4VIgl8TCIqZBGwf8rfR+Ey0PC5XEYw1AObAX?=
 =?us-ascii?Q?S/JaaKCxcuZrwndx+zZmV9DBZdM16jllW7o/sVoLRSIdivZQ+8DENmxZsRnQ?=
 =?us-ascii?Q?Yl5xS/ufIUa2jdkblm+S7cwbz2xTq8E9HYQ7RTq015dBGGqY92zsvoJGkSiJ?=
 =?us-ascii?Q?j5/nc0sDv9qKsOQ+1vaLuAwDJLxTHex69RW8zdOS2MY5Dc+eiC1ysrHY4PJk?=
 =?us-ascii?Q?9BPoA8zPRFpoc+sDSTKAMLWxwEY5ifpyLihYa0CjHGZzFdIugZbDnwEVk0vy?=
 =?us-ascii?Q?EfDlMhozqJPJDCigoMmZMGxEsT2VMhozrboVySNzgutRe9FjYtVieIHXzeKD?=
 =?us-ascii?Q?Vkw30PL4DnHixXBZgSAmLJqXDQi3IuovY4PXd11Lw/7nILxGsP7ZQG5U7N4P?=
 =?us-ascii?Q?VsgD9U7tdyLJQZwfUm78PQHepMVRrvFKmJKHOiAd49VpTwxbL+KftwtH5KnR?=
 =?us-ascii?Q?fbPGtM6PJcpxvRW/DSBitmx1vaEAkwAs5cWOMBk5SLv6IQ1eBlHI0pFCVbkd?=
 =?us-ascii?Q?c+BGYvEPUyRMs/ZwtWd13LF0aQPCtK9LcD9hsOJeuhYVBmGrWmQAL6LHT8OW?=
 =?us-ascii?Q?BT9NRmsDPhCEdDDBezeO3I6V+H4uOqvlEEgfySSGT8x/mKDE5pber6vzypSX?=
 =?us-ascii?Q?HnFeZASSIbI5it9APNx2HK/Tbkh/VkJJ7EBtUOoTKtwLQdAQNNMHJkB5dnII?=
 =?us-ascii?Q?R3xQQhX0bz7EwXcfwfxhK4FFHsMowu5cWbjNTTZzL7VJSwT5bB5rCLbUtjBb?=
 =?us-ascii?Q?jIK02sbpDFwXamNE8wLCEQ2RkiGD/GjkMp80J8zlu7VHP7RBifsMz6jZR/eM?=
 =?us-ascii?Q?FE6MA4L64ypfJp8IVuV9i5by3ViOK4ceWBxFFcMpIeYxhXCmDGnxRBav0mwO?=
 =?us-ascii?Q?uKMN2BEIqisa+TdoHzKvZ+Y3Cj8kkoaweCFL3nVk1nNnkOObAICbZuEsxnsC?=
 =?us-ascii?Q?OKi6e95lpfQjvs+xHhjDpTQaQ8D7aDtKxmFbO41fKKd9MjBcQ6uAW02DJZnu?=
 =?us-ascii?Q?6PSZqgUgsHbgFlaKmn1h7O88mNFEd556IQUZfvuiLFbUqK1/lFSWv/imsmpe?=
 =?us-ascii?Q?d3wGiGSNFZJnprGICIOXZpIckBHCM8mv1Qc/YZEW0yC4go/3zNKlYXOMi0Ay?=
 =?us-ascii?Q?ENcPEg798clByzGDxOgYuwsGQDZhm9SzKhhfCX86f43NN0RFoHQ3puMlZ8Ia?=
 =?us-ascii?Q?pbbxDUdyXGhaexNWeJABUlZg/oi4UeRzV8qpOlnrMof8yOQb5OnncReKc9Xx?=
 =?us-ascii?Q?Bk0EvzVCKVi2D3PfrOHZctJlRiKC9ZKLPBtRqQFNMT/epoPiuNyx8r4d9IhV?=
 =?us-ascii?Q?Iq5xsrLlqNSlH0q2WlXT6Txa+RRqURdtQQTsgKwp4UKN0lSMd+KGPR0r8WGk?=
 =?us-ascii?Q?n96PPqF5C3VX/BdmFaiWXCRthE06kuOyCxxwelus76bXsqMC1K6D34+kZCGN?=
 =?us-ascii?Q?RkvBF5fnMm/NjElhHmYcSxbOhNSph31zJXhJxoBlG9XmXDkBqyMbB7nkjB4i?=
 =?us-ascii?Q?E8llbJzkaHklUFmOYbT2dXwEumm/xd0o0nBuUbyl6A+XxQq98G/pgZcUvdCE?=
 =?us-ascii?Q?kWYYtiOcb09e+5a/M+DY7JHZ7ygl+Erb9IHa0bJ1/vI9YgnaRCOMelInmQY1?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aeH4uyIxW8HR6TxQIViMOfjsawPqDNZKpT/v3yn04rr9cv50hocbZlRippyUth8dGoVWcdUn2WyBlx4/81k3m3+RNg4JJN8V/6M+51RZsp8jdEGRtO39HGnLmUwLQjspaIYsNCRj+9fBZFW0Ng+qL+V/Dn2kG1itSSUa9d3Xg9l90aBSBBu03nBcwEvi9iP7rTs4C4/x7JhwZp9gxL03g0/IlrG4/j+fLh42DM0sMS0U374HcPP1X315ALXojqsQLeTgq53ELzzh8yeHeGkmo68FS6PajpjpFI2e6BTOtbS7hpb2jRiJYhUZrLWRjHJp0AO17cXbLgTlIfkAdt2uhPf54lCN5J5tk01WrWN7aLG4j7x/ntJyZm90OnZcORJNno7AUDJVsF9E4fRf4FUiDGSWlAZLJPf5X7Zs5ssgTiG3553JGSCdiNIYjE7qK4Vgg8X2o8y1Eb5okufjE5M+DiAgtSDwXu+5NGqWyeIPgic4/v6byDrgirR2Xkdk2yTPguydjDyf815vyLBZiLjRwF0AAPMem0rI+cydTgXDi9896BgVLwf7LoFiw9+M8dfQZhBXqMd08s2OU39Rx9SwPYDiC5PsuxLLviNNPSH7hK8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1b574a-1e93-4b59-1a75-08dcfd2dad9b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:20.9597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XMpC6De9RTpjAZLCgW6pDaoYBHWBL7qXH+wuP4vd/UpUL9zcU/VQLqLxtA9BC0UZ2+cG5GSooC7pAD0pLOCWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040192
X-Proofpoint-ORIG-GUID: JwsUE-Hu6QQ1Hpd8U4ulBXkHVmvYP7md
X-Proofpoint-GUID: JwsUE-Hu6QQ1Hpd8U4ulBXkHVmvYP7md

Before now, argument mapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that arg mapping is also applied to
argN for USDT, even though this is inconsistent with SDT and arguably less
flexible than having argN be the unmapped arguments in all cases.  Add a new
function dt_cg_tramp_map_args(), which can be called from trampolines to
apply mappings (destructively, but it keeps a copy of the old args in the
save area so you can unapply them if you need to).  No existing providers do
any mapping, so this is not yet called, but it's about to be.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 26 ++++++++++++++++++++++++++
 libdtrace/dt_cg.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..464ff781d008 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,30 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Move arguments according to the mappings in the array of arguments given.
+ * The original arguments are obtained from the saved regs, and overwritten, so
+ * the regs must be saved in advance of this call.  In effect, this changes the
+ * native arguments: the caller should adjust the mappings array accordingly,
+ * and shuffle the native arg types to match.
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	for (i = 0; i < nargs; i++) {
+		if (args[i].mapping != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(args[i].mapping)));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5061,6 +5085,8 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
 	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..fb26c125adbc 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

