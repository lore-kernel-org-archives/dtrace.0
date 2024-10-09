Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA217E8E2
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512784; cv=fail; b=SjyNnmXZQGUzid0bOQSk1r+kfqwh9MxgTEXDMJZ74wN4fct2Z9nKrvHl1ZDURu/OhihttPd6c212RjOrQT8YgR9y1xjDKilUUjpc/lM31QwHNCGmHJyTdWIQK4azQ8Mqr37Q+ldr17YEb/uYTbDz0tiyDp9syTgCoKvVhK+Otv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512784; c=relaxed/simple;
	bh=L7HR3Zvoj8v7TH8VTwq3BqO2ywq2gCeb0Qcof/z7Tss=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=A6XgKUVrmMFN3k3QEGW5vx9FVfVnRwcGgU+cDD7qSrFF48obPGmbA4PfIl2bXHXBAvm/6JEvro801fQjCsqPIuHA4x7QFqFvgAwT+p+CC0opWEhodoYaju0geeIzkIDLpGpGxlYBM55a3KCt/QPfm3aYKdYv+wItKl93N7ee5Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ibOj2Gtw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Snf7yrG0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ibOj2Gtw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Snf7yrG0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499LthSp026060
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 22:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=M3pwt3TV/kcL4rNMEuQCVvnF0irzIfTe21dBiVF+Ktc=; b=
	ibOj2GtwpFuXeA8BF90uWx9B9I4swO5hsHZ2jswSLchj5ntfSFOJWcRpB7biiXaX
	E7EvhJCAZEu4N9n8M8V/re8DJ4euCWQhRre0JxYmeClCekZ7D2EuHzgSq/abAGn6
	JikcKGpeqJsMrDCl/v8ncV8RbnGhgK8aVfBq/rCh+yWeB7gMAbXCBdAXiANyAEOP
	qhZ2WvyT4eHEOG3WhNzKaz83h++LszGGDjBFuMtovMZLlBE4/T0Irxc5viQrtQ2Y
	cqNvBBzxzYdVXpkCYs92vCu5mf8bg89kzLWKocAluBwvY55HE85GAW1PVI92y5QI
	0JF3B8ojkWyPYzlhKU+vfQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42300e1nww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 22:26:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499KfMaY023112
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 22:26:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw987y9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 22:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCjYWaQVklxXk+IKH6PXFjAQx99fjM9U2Z+ZArceJn9wbDJ+P3p+cvKzJ770V1m8DynemEC59BANYA15mwb0IpYmqj7bpsHLGzBDdNc0ubP+Yu/g9gUzSiDh+rfTBEkq5XgOlZbMh9MRFEWpFYMzBZlJ3N6iw1m0QwRgOeOZnxxC4qe+wFTpDUVK6bpqW5OSS8iOyfNpFLTHw3OCIGgoS6J1c5VjIQcwCi+xpPZUkHtxeCA1tyyS79tv5In5SgKvnZf081LzwK/7uC3A6WYb375qMjal4OHHN7PjKLtagQOmulvRdZrsZ5/9e/Gonnzsu0Hel0C4yLlpe5r8xu7qeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3pwt3TV/kcL4rNMEuQCVvnF0irzIfTe21dBiVF+Ktc=;
 b=SdCOgekIgH25ztHEykpFtJEahmFDtnxZG/nd09lRYY+1E3oW5yNtK/hJx9SHae4+kxmaNjN+EmhEi0GPqNrvJtE48EmXI+K43FSst9m9XHhuQLxByWvefdSVHWfVBrj6BF6PUcfDYAJTcqOeB4F2X13iaD6kV+lv9AKv6D4FX1y8lKKzdl2RMUo1lNLR6iSOqDsYyQxwhUnG3Nh53Tf9z1bAVgGUXJ2Aiqd4hmRIVIpIRoJ5Tpny8VNWAtyXmCaouC9q7AmWEbaddiOoitzFgMGlsB3y8SNeaiYsBzkSDabVXBvdxQJI6s5ilP7fvlspuNARW7vONBKXy2tehJyQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3pwt3TV/kcL4rNMEuQCVvnF0irzIfTe21dBiVF+Ktc=;
 b=Snf7yrG02WEv/5/HYEcXDIvXzFNXbeBuQ265GRTN5bP47xICfMy5v+hecbE/x4S+vEc1GGdltvslCSzac4W/B2OdSfe8Tvb/QMFioBEWFgXVTfVX9OM72wHcAcbj6NW4geOPAa8yFHhdTgeWd3es6ytp/zlcal4z9s9W/GcoBPs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB7412.namprd10.prod.outlook.com (2603:10b6:610:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 22:26:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 22:26:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 5/6] test: Add USDT tests for deferred detection
Date: Wed,  9 Oct 2024 18:26:13 -0400
Message-Id: <20241009222613.5553-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0944.namprd03.prod.outlook.com
 (2603:10b6:408:108::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ed01f-256b-4131-2233-08dce8b163df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hTpFwTt91/qIeH8SSECm11YBYZ33nkFfE+zCxxc5NAhTypRObSk29ICP2WnD?=
 =?us-ascii?Q?XuXm3fSyXzd628aau6+ezCYlwMAbpMr1u8yUnopVTZL4p4xmuUyTVu7tXli+?=
 =?us-ascii?Q?QfuhjoXKEaYz7an505GF6ggzrkaTw/dpi48qLEEjZR0NY83WFny0EobJNS1s?=
 =?us-ascii?Q?OI0VbI5uX7NfDY5XNx4YwfjoyCjkzrjJmF5hd41Vty22pLzmWJxkKc2ZT1u0?=
 =?us-ascii?Q?5MW260m6lZnNeqWxk0Sv5q13ryDQZ9l3tqJcuQzBR2j4IqyMAO/21BtP/Np5?=
 =?us-ascii?Q?W9zCQ5egpgBqi+1A3FyqUifGzxcE0D+tbMaYF6T5OgNXlxci8Czef2dZdxy3?=
 =?us-ascii?Q?WgOM4XnukISE+4bywwpRs9SfNtM9sSbt1LwUa2iL/wX/nCqiwfSHCAgkvzz4?=
 =?us-ascii?Q?yunD22dzqJ85qj3F2TGfwtJaucbiOvR+pAtgrKYxZfOt8hjJJ+K6vdnrcsv/?=
 =?us-ascii?Q?F90n7GLNXGyWttoINNGQmb0ho7oacr+UGO9N3AoPpr93QF50yedl75d1xcxz?=
 =?us-ascii?Q?RnrVhKvYd/Gw155CuI1TAk6yVhPtedE8LUpv4pQkKK1s66ohoLCj3yz7lPU/?=
 =?us-ascii?Q?YVJJCkpA2tyIpPhNK2ZD+Ves3uatnoLr6yVhfNlf7HPdC5EPUxTzL0+xqX9S?=
 =?us-ascii?Q?p4gjcTFBR5gO/4K/v4Nmp4/wen/repsCh5mhTubrcBccNX4zaucga102CJac?=
 =?us-ascii?Q?9uV7i9+Cut8h9P/ZCTdPJbwbV1rx52BCCY3UIp8Nnmc3GtmSO4HsG0Ayfngh?=
 =?us-ascii?Q?xCwtec6h9Bd8xSC3zxapD4GkNp0RzxKIu6EukePAgrNNusXPW9dKw1Qtxmi+?=
 =?us-ascii?Q?Qr4inzISn1qjlxXT0P0V/b9ioOVBYVV0CezK78kA2P4shUEnN6EXGpOHm3Ab?=
 =?us-ascii?Q?LrbYVWnd+CGRSAzjXyGUqvm3BA4r1yh7XlfO0IF8XYBOenaAzfqZDAQULnxu?=
 =?us-ascii?Q?XGWLEeBeM36z5tonzajSSh9z41qVgemMCgeVXx6pyCDUdqcDgGSg9kXXff4k?=
 =?us-ascii?Q?WGLEvm+xAQVd3LIQ+6k2HakXjEvVAe8YmCUdfnlXrDolaCmyp8Myn58Wa9xu?=
 =?us-ascii?Q?SOCigtyMymqfmnOn9RIb6hhvlFj2dJLpi6fIAjpaA8eMbNfbggYCdYEs3lMj?=
 =?us-ascii?Q?wyYHpIeBVdrRtl2T7MpalP4Q/+6emsOqDDWlZijZMylHJlmpSkRIP+/IhgWj?=
 =?us-ascii?Q?tXKIzWow45+vyp016V/F9T010zS7MSdktYdKRxDKlQRyo2LNhfTKr5qgVNYT?=
 =?us-ascii?Q?vyngGc37yQfl9w9MMRjUMbBMCwcZXOCoj+fH6Ad+Bg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d1BxTkq06NJ/qaaGFNE6dQtkO4Oab4rwsoDEg3o3laOZHX7WiYgerbLg3ujy?=
 =?us-ascii?Q?HzTIfo17e2oKIfqiLeXmE5R/tIq8X7ROxTF6zCCxAV1KcfG7o7lNLVTffOSa?=
 =?us-ascii?Q?XP4MAkcHyDdBufRioAFEOViCddqnEGmmiylfGHijg00QlPKZgCqcBtdjfh/3?=
 =?us-ascii?Q?5M6/tbSyj2cH7fd7VcOieTkztXvfxGyMGM3Uwn5oL/I3oP3eoY+AaIVaumUg?=
 =?us-ascii?Q?3yDwL34nFVP4uio2rGfjIYB8nDgUcb8E/qBuUZxeqURyceHikA7VqA+Sf1F3?=
 =?us-ascii?Q?CqFF0esyIjoc4pRlTWU3jMVrvwZM6S5q6J7FXKOtjr3Yq9y5Kx9chzrsBBqV?=
 =?us-ascii?Q?3c+yrGT/bJZiZyKKwet4KGHy4sy+1cTCXz5wBeJnOSoWv1Spsr0tXiKstey+?=
 =?us-ascii?Q?Jr9/+5Z1HsTpijlAXNDBIcgaNo4fWVtUCCBp85VzR+EQOEBB+1OCHD8ox3p0?=
 =?us-ascii?Q?wbRo7NcFyDGYN95IrDWq4ejrNTrIFylvxMvy/GN0aG1Y1EeeDRQZ4Ga+uqaY?=
 =?us-ascii?Q?Lf61V+pBnyip2aQm/FtIsCBetoZuNwetj8at4pUzc8CpHcPQnORx9ELF27F+?=
 =?us-ascii?Q?8b1j3EbQdS0wGQqv3BTUL3vyt4nKj4KJWUl3XqxVetqARBh23EHlB5RUihZh?=
 =?us-ascii?Q?aO7mjDugSiaFLY5pBW0oGxZps9hLBFosALTKimzCp9yA9MSEBCfXgKwvOyXZ?=
 =?us-ascii?Q?D1EZSg0SAVpi+vNyCv7uHeDfqCxXbDRCmeaS5QUXyMEieu4XdDbAVWBnVzFz?=
 =?us-ascii?Q?3xOXeKXF30JE77cPf+UKy+9dT9RIWuNUF5li7oimP00B97wzUOihK4weC5I2?=
 =?us-ascii?Q?QOKR6RvquEkhq4XvOSO5g8+N08GG8zfHKAJMrOW0AeybXtCKdiilUttqwAkP?=
 =?us-ascii?Q?1lxzLD4JFiR4z+cl6V3DUbdBtHGS+7RXih3Oe0kGXa37uGi0Z50JYp6QoMlc?=
 =?us-ascii?Q?KM9Hl5hcF/Ir9YJDjJa9I4x31cTjjN5iLC6ArjkM9iUepw049XNv1/Q71B5l?=
 =?us-ascii?Q?whxueU/O+Z75pE0O0Q8dkV+rGhFBMefNTATjoKYgeTJHf4QQ8ggxb5VgtEtj?=
 =?us-ascii?Q?g5jIN0IFgruf1V1bZNSSid1ikbvr/wjDliK8UF5k7OOt9AYNeKjpZ7/J/ZCt?=
 =?us-ascii?Q?oXzByJ8ISCg8d8RoNqgnJT5TCloU66s8L9Xu51g3wE78OddNjYKtDwW+fuYS?=
 =?us-ascii?Q?VjJ6DE/GJzXMyPv6TTT5R2ywHdKddFtYq4WzAbDbdwIojWgnIdSYxGpwzHRy?=
 =?us-ascii?Q?1alfZ3Widpo5lATM44nuobBVzr+hbbVQd4XrfOrUT8SrwcJJ7345nYygz4o5?=
 =?us-ascii?Q?cUuZRN0bYXGEFwIZM+IVvqNSHVXZLDFL6Ce8XXNpirRhaYU7PET8H+1MLnVt?=
 =?us-ascii?Q?cAoctMtqmpxGWRrlcFLq5eZuXAzbSbhmeCpMUW3BknnbdFRibkmDPAx7dnKx?=
 =?us-ascii?Q?LGtcPe3vTopdhkDp+yIjddJY0zpCC6vWXHIw29/wQ7PXwlycXoOqEU/VmvbN?=
 =?us-ascii?Q?QjshS5T9sKlj+7k/0XSXzxC0/oMQZMYiaq1h/XA6qCaXy36AspJrB9ol8fSV?=
 =?us-ascii?Q?Yyptn/pLHJufjbOdm31eFuSw/JC5PUQkDm5EPOCp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/vBZl3DS9ssOfTmmSrhowMIodn5PRCOGQ9PQu+Zw3bIJ6G/b8vWuimyI7cP0CVs7q9VO88PfmZ6fLg6ZxAK/ujW8B/ZEct1et+yVXS0xgDriwvzqTq6Yh41m5U1a04CChmcUm6kc8hZpXsES8iB1JKeVG1W0WkbNsGigUxin7UlxRDNt+U2OC2riPJsN3WGJUNUCET0eMuzCV8vhtgqkGcp/pDBV8XBFq1LBBdmtHPAXSyFnDV/YrA9ejv9N/+JNiLaoWtH+UfeMe+x70TTUemgXi6eye0PB/MpkToolfqAAT8pStGvILSzPRmepOVyz20R/iHAFqje/gqTMApkoYutW5NqllAsgB4XymQDVEzl5kdnbHFVpplMekK97xU+5IRbH62byyeKqZT8nU7klD4QfuLXITNsK6nwLWdzAkBg8eZEx9noUJJrt4eGSRz/t18MiHkmNjR31ZXC8s4fqWLaLqaIkPScC6eSihfngh2TxpgEgwJkxNZjx+EcGsubI2w32EqS31TOwk4pI5P+GstCBZE5zw3wD94tUSeeupNcBjKSozcpRD4+pZenxYAyztqd45G27IunLnbq0q9W94HN2NBAOT+BXOknBFblMtUU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ed01f-256b-4131-2233-08dce8b163df
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 22:26:16.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYjx5aFEsEiiah/pOtQbMg/U5v6oSkxLI3sM17jVlZTAabH1iX9ocsm69ktt6m1ApyAadIBPLgCtvbS9HMxdQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_20,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090138
X-Proofpoint-GUID: XK17QjzS5pb5XnpgwoAWl7ripQ27VB85
X-Proofpoint-ORIG-GUID: XK17QjzS5pb5XnpgwoAWl7ripQ27VB85

From: Eugene Loh <eugene.loh@oracle.com>

When new USDT processes start up, we do not immediately trace
them.  First, dtprobed has to see these processes and then dtrace
has to find them.  Hence, many of our tests XFAIL.

Add some tests that check USDT tracing on processes that start
after the dtrace session has started, allowing for the possibility
that tracing does not start until after the trigger is already
underway.

There are two cases to consider.  One is when there is a USDT
process running when the dtrace session starts.  In this case,
an underlying probe is attached and later USDT processes just
get added on.  Another case is when no USDT processes are running
when the dtrace session starts.  In this case, -Z must be specified,
and the underlying probe will not be attached until one of the USDT
processes is detected.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.defer-Z.r  |   1 +
 test/unittest/usdt/tst.defer-Z.sh | 153 ++++++++++++++++++++++++++++
 test/unittest/usdt/tst.defer.r    |   1 +
 test/unittest/usdt/tst.defer.sh   | 160 ++++++++++++++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 test/unittest/usdt/tst.defer-Z.r
 create mode 100755 test/unittest/usdt/tst.defer-Z.sh
 create mode 100644 test/unittest/usdt/tst.defer.r
 create mode 100755 test/unittest/usdt/tst.defer.sh

diff --git a/test/unittest/usdt/tst.defer-Z.r b/test/unittest/usdt/tst.defer-Z.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-Z.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
new file mode 100755
index 000000000..52e92eb6b
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-Z.sh
@@ -0,0 +1,153 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT will see new processes, even if detection
+# is deferred -- that is, DTrace does not know about a new USDT process
+# until after it's started running.
+#
+# In this test, all processes are started after the DTrace session has started.
+# So the USDT probes will not be recognized at first and -Z must be used.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/defer-Z.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Start dtrace.
+
+$dtrace $dt_flags -Zwq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}
+testprov*0:::bar,
+testprov*1:::bar,
+testprov*2:::bar,
+testprov*3:::bar,
+testprov*4:::bar
+{
+	@[pid, 0] = sum(arg0);
+	@[pid, 1] = sum(arg1);
+	@[pid, 2] = sum(arg2);
+	@[pid, 3] = sum(pid % 100);
+}' &
+dtpid=$!
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died
+	exit 1
+fi
+
+# Start processes concurrently.
+
+num=10
+i=0
+while [ $i -lt $num ]; do
+	./main > main.out$i &
+	pids[$i]=$!
+	i=$(($i + 1))
+done
+
+# Confirm that dtrace is still running (otherwise triggers run forever).
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died after triggers started
+	i=0
+	while [ $i -lt $num ]; do
+		kill -USR1 ${pids[$i]}
+		wait       ${pids[$i]}
+		i=$(($i + 1))
+	done
+	exit 1
+fi
+
+# Wait for processes to complete.
+
+i=0
+while [ $i -lt $num ]; do
+	wait ${pids[$i]}
+	i=$(($i + 1))
+done
+
+# Kill the dtrace process.
+
+kill $dtpid
+wait
+
+# Check the program output (main.out$i files).
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -lt 5 ]; then
+		nphase2bar=10
+	else
+		nphase2bar=0
+	fi
+	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
+	awk '
+	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
+	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
+	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
+	if ! diff -q main.out$i.post main.out$i.expected; then
+		echo program output looks wrong for DTrace case $i
+		echo === was ===
+		cat main.out$i
+		echo === got ===
+		cat main.out$i.post
+		echo === expected ===
+		cat main.out$i.expected
+		exit 1
+	fi
+	i=$(($i + 1))
+done
+
+# Check the dtrace output.
+
+#     regularize the dtrace output
+awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+
+#     determine what to expect
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -lt 5 ]; then
+		x=$(((${pids[$i]} % 100) * 10))
+		echo ${pids[$i]} 0 45 >> dtrace.out.expected
+		echo ${pids[$i]} 1 65 >> dtrace.out.expected
+		echo ${pids[$i]} 2 90 >> dtrace.out.expected
+		echo ${pids[$i]} 3 $x >> dtrace.out.expected
+	fi
+
+	i=$(($i + 1))
+done
+
+#     diff
+if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
+	echo dtrace output looks wrong for DTrace case $i
+	echo === was ===
+	cat dtrace.out
+	echo === got ===
+	cat dtrace.out.post
+	echo === expected ===
+	sort dtrace.out.expected
+	echo === diff ===
+	sort dtrace.out.expected | diff - dtrace.out.post
+	exit 1
+fi
+
+echo success
+
+exit 0
diff --git a/test/unittest/usdt/tst.defer.r b/test/unittest/usdt/tst.defer.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.defer.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
new file mode 100755
index 000000000..02ed1a767
--- /dev/null
+++ b/test/unittest/usdt/tst.defer.sh
@@ -0,0 +1,160 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT will see new processes, even if detection
+# is deferred -- that is, DTrace does not know about a new USDT process
+# until after it's started running.
+#
+# In this test, a process is started before the DTrace session has started.
+# So the USDT probes will be recognized at first and -Z need not be used.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/defer.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Start one process.
+
+./main > main.out0 &
+pids[0]=$!
+i=1
+
+# Figure out the pid's trailing digit.
+
+lastdigit=$((${pids[0]} % 10))
+
+# Start dtrace.
+
+$dtrace $dt_flags -wq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}
+testprov*'$lastdigit':::bar
+{
+	@[pid, 0] = sum(arg0);
+	@[pid, 1] = sum(arg1);
+	@[pid, 2] = sum(arg2);
+	@[pid, 3] = sum(pid % 100);
+}' &
+dtpid=$!
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died
+	kill -USR1 ${pids[0]}
+	wait       ${pids[0]}
+	exit 1
+fi
+
+# Start remaining processes.
+
+num=10
+while [ $i -lt $num ]; do
+	./main > main.out$i &
+	pids[$i]=$!
+	i=$(($i + 1))
+done
+
+# Confirm that dtrace is still running (otherwise triggers run forever).
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died after triggers started
+	i=0
+	while [ $i -lt $num ]; do
+		kill -USR1 ${pids[$i]}
+		wait       ${pids[$i]}
+		i=$(($i + 1))
+	done
+	exit 1
+fi
+
+# Wait for processes to complete.
+
+i=0
+while [ $i -lt $num ]; do
+	wait ${pids[$i]}
+	i=$(($i + 1))
+done
+
+# Kill the dtrace process.
+
+kill $dtpid
+wait
+
+# Check the program output (main.out$i files).
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
+		nphase2bar=10
+	else
+		nphase2bar=0
+	fi
+	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
+	awk '
+	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
+	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
+	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
+	if ! diff -q main.out$i.post main.out$i.expected; then
+		echo program output looks wrong for DTrace case $i
+		echo === was ===
+		cat main.out$i
+		echo === got ===
+		cat main.out$i.post
+		echo === expected ===
+		cat main.out$i.expected
+		exit 1
+	fi
+	i=$(($i + 1))
+done
+
+# Check the dtrace output.
+
+#     regularize the dtrace output
+awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+
+#     determine what to expect
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
+		x=$(((${pids[$i]} % 100) * 10))
+		echo ${pids[$i]} 0 45 >> dtrace.out.expected
+		echo ${pids[$i]} 1 65 >> dtrace.out.expected
+		echo ${pids[$i]} 2 90 >> dtrace.out.expected
+		echo ${pids[$i]} 3 $x >> dtrace.out.expected
+	fi
+
+	i=$(($i + 1))
+done
+
+#     diff
+if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
+	echo dtrace output looks wrong for DTrace case $i
+	echo === was ===
+	cat dtrace.out
+	echo === got ===
+	cat dtrace.out.post
+	echo === expected ===
+	sort dtrace.out.expected
+	echo === diff ===
+	sort dtrace.out.expected | diff - dtrace.out.post
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

