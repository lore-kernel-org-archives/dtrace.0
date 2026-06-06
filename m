Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1359D4071DB
	for <dtrace@lists.linux.dev>; Sat,  6 Jun 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780708112; cv=fail; b=OcMLGJNxIhFojcKUtyjQtQpETmvKtDVyR3mTcf1YxEaf0vRXpwaKqil+xEvhoSKiaP6PXeu249mIMUkNcmbWNxzBYz4Gw/XSl5Dw0Aw8MeZ5H7K0Z03mFkZr9HVnJXtIsgvwGIU3xydE+twVQQE/Zaqih/t5f/PpxxgMKhCYEG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780708112; c=relaxed/simple;
	bh=DKysBeAu0J+pUxSbiKKvx+5WGk0Dw5TkD5QxXPHCjL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NS9RdfAEg/AZa/TvfRGVsPf2IZX0sq8iU22WdfvLUZ4PpcX8DZ0/gZESE8rv07lpRREZp0/Y2xY2fpVEih3/+abr+zTYaJQRTd9oABvj0yGfZbFCdltTu4Jz9UxxRmq2Y/9dhGJg1c5eT/PM82Lasvjx1W8ib+3dLj0OqWeB20g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RKujGDh+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xo8JLh8W; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RKujGDh+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xo8JLh8W"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6560J2Et2955186;
	Sat, 6 Jun 2026 01:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cd8H/MjBWMjyzK2Hw8
	06osk61RC2YbLZ4e41KCVM750=; b=RKujGDh+jh/DxEh6n3l7pzZRrG+S023Buu
	pxNXlrYEU8238Y/4HUXjb1zfTFLKgC3VPI1+hEWf0tAQV/8lnAeqHFNDG8QG04hN
	uMhFlguFO1zLl/5ic07M/OSTRRb9Nt3FuXNnRU3xQ9qKhT7Tlkns+qlHSNuO+OUC
	e1hYikARjuLTc+SazI61y8F9dhWIrnlwBN6WY7u9MQDaqkpNQ0hwQQglju3n1juo
	E0pdIegLObHmzljnA3GoeEEWTMG7nRoZbeVH08BwW3IvlEzjtSp5fjdrTtfngnMD
	ZjLxlsoQWCI13PAYMl1YENBg9Mi8Rft59Obn6YGhdBI4hnNZw14g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efptbu2we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Jun 2026 01:08:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65614ue6010201;
	Sat, 6 Jun 2026 01:08:27 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4efpbhxfhf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Jun 2026 01:08:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+120n9Y5rdpQa1xfVMAI3aPqJ+VF5HfBYOUdZHkQ1LLb2FP/QsclG2hGvLY4LmJezg29IxFw5g4Z2jk2Kx+aBgHS4uy7GaOmk8XRXDW5XMdN/ULX24je2Qi9f4O7545RG/7/iHev/6bk3wM+aOP9Ag6QTth53zkYUE1783N+TM81KnrKjaKcvT9iRNyErc8F2Aaw/RkdgfLofsU/O2GgBiiChwuNlRRGDrQcl+A3YF4w4SHepHKKFsf7TQRTktabasb2IdmITKYByNl+IHXgbGuXr5pw/TW9YzmGamw3aguuU4sxsZFNrTmK5ShIMbY/ylq3S+/hekhTGZrBJ4NOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd8H/MjBWMjyzK2Hw806osk61RC2YbLZ4e41KCVM750=;
 b=E3vh9CSSP40Cqy+/bCUMHb23fWwHtTbAbbduEQu+aAW2ypxN0yCPje2wUhRcdEAl+Ridfl9Jm5EeIQFOFMPsYcE+Kn6vobfM1graRlS9z9v1+203tdSZxDBVopItY15w0ytoTHYaXU1nGWDJtaA9W7IE8fTYSiCv52rX0ZX+SFjPk065+NbqDnVr40g4b3+KJjoh1RfhzTMJNI93zRdU2HU7wGMHy+h83XAAAK4MOlMMY/xKq9tTshPookFe6+nU7vNX58RTxd7z7rD9jgb2iE80yr7CfmHW/O1/qT4hRndBKefOQALNlhoWmB/jx3jR5Oewv9fxAnPa27Knk7//hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd8H/MjBWMjyzK2Hw806osk61RC2YbLZ4e41KCVM750=;
 b=Xo8JLh8WqyWIw1StZIalYEeG7R5d1zCmmuT7e3mNpJa36nGuqpIKcHLr6FS/koOvvGsZp6ChBDBBTineHoBs5v++E8XoHQYFSUSprU2jUXqYwndZNr4uMjYTqRGRdE021DL+/PmAlosGawWODUaCkwu8jc0w/zDTaazwUsCC4EI=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Sat, 6 Jun 2026
 01:08:23 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 01:08:23 +0000
Date: Fri, 5 Jun 2026 21:08:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, OpenAI Codex <codex@openai.com>,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/6] dtrace: Add uresolve(symbol_name[,
 optional_fallback]) for symbol lookup
Message-ID: <aiNzBHzLAk45BqeS@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-5-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605221217.1211791-5-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|BY5PR10MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: e326bdba-5b73-4840-e5b1-08dec3681b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|3023799007|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QRJmd28QvEGd2yLHfZGS4Y0WZNGmeKIF95P7fqFEwh/SnC40jIztOsB3w3ykFgN47xuAItow0bjLewU9yHGT0QmVl0kCp4obuj3CwfIjlV/8f+xdHIAc7vrt2V643Ym0jxN4P3VfWjYuKyZBo1YZ0ZuesmesFAY2vTfSZrbB5F/Y6RjEBzORU2P2vz/+oSTXvIqRVDO/7DMB+bvjQnSwY0i977YRe/wv2ZzSxNeAdxrDqitaRnlWp/LmNP+DOOhvjtm1SsBNGXRTBrub32lmIQbP8WivmPLbvwY0m/soYUtQQeIaXr8tiWXr3LT1uXxK3Vy3sATwWVSTl/sgPj3iSRP2zRm34Wnjxc8nMUyYbcOHACPgCcy1lVXBSERSNqGZUlJlU0FrlDn3qeRnif7p7ZsOksEjlpNFDdXZN1s5of8A9sViUjfiyCsHmR87Hal8bkBecbdQwt02PSvm6QomSp99HMrin0DXlKH/eiqmHY18cc7CLeRUMW7ldY/FAiv3RvQ8YOlIsQOzNUTka6ca7AxUoTXiV3RrsauMTAzi860x5kfXm4Vp33M7azDoAjIONVR0E+nEZfVvlYQU9dm4g7XbfEgawWd2odP2tHksMv/YYoWEKTdWQyvIzfOiHD8WNbridDMNcNssK8+uC+Qsl+6yUWs/gHuUZGQhHFpXYA8DaVeVPV17ankWR7mWc4pp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(3023799007)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fOScDr1R1t+68lyELz1Q8sO7+GJaK2NCSgKY+LSkw3clRQGQLBpeLnVrJsXI?=
 =?us-ascii?Q?lBTxD2H1VxWEz2N5eeWLl0vAES1U5DiNS61k/EwoJ+GH0/9K2yeEq8cZx5tg?=
 =?us-ascii?Q?PZK7nlLwOS8mFM57kdnUKXr7w3S07FKR6pw1uH+1VYzHEe/PIeZKlelFSPnH?=
 =?us-ascii?Q?mHf8LYNRjvsoBx9U3E7/iwcRhGa1nO8TAzAjHSehx5KrfH9I0DZa2Cy5greJ?=
 =?us-ascii?Q?ueScgCPRdWjN+th35gZTfBLaxClsArYEGiOkqK3KrMMWxLHVSK3VfML3IYcA?=
 =?us-ascii?Q?d4vMWrfFhpich2BfqGpKbhwpktiQTzAX8ADYuUfPHvkDGH36KmUyIZTpdzaX?=
 =?us-ascii?Q?WfBEmlVqx6/lRFL4fjuZDPwTcOVx6j2FKOkgkBUa/Tx6INWAvEX//zWtJpwq?=
 =?us-ascii?Q?zGoACOe8zVSAktbeOd9Il2MfxdUvt/XBlNsYa3b/TqI4M1OqUWT6O1XsFo4h?=
 =?us-ascii?Q?ikjCVsNTeGlYbVaSeo+1tRtZKaVgB8HVO6zfkkwLmIM+RXluYUNZyJEo5wDk?=
 =?us-ascii?Q?YVmxJXxE3TuAM/mzr1jpove6HOBwDvHQzwogUbSfDrTeMkC+nUrvfsAuwnOb?=
 =?us-ascii?Q?NpBwlBaWJfOKCKsyw42GjgGP0B/ka0iZZVI160sqnSFqyYyaVYEbbfW2Tjdl?=
 =?us-ascii?Q?BmGvEwKUv6Se/5iva0Qh8fSpEwuPLaRomptJLMfH5trYP3u5QTHyjkL+9fgA?=
 =?us-ascii?Q?vecbI9Z3e/ESXD1k+iIwSGSfC4e0bYFZNVUY9bD0SE95wbF3yYC18jAcpv+I?=
 =?us-ascii?Q?sS9S0oNEVjUoeuqUmvsyfYXFNyP/8sDfakDYqEN9yqjxa8FNfVKSU3DSapW4?=
 =?us-ascii?Q?aHINlCsaRLlhTNlMSg/0tXuCZ8y6LBYFGdpx3p8asx3AtvRCJCX9w2zuycOI?=
 =?us-ascii?Q?EukA+9RO5EEzwzvlP6rnvp6ed1ktUMi5oni9rMueNxg3d06Jqs/x09CDxbtv?=
 =?us-ascii?Q?hLCfcHl5JYAlyLsbmPWGQMU4A5/gBnRim719B2ku4dP4VhqjEcAKbZqmEfJ2?=
 =?us-ascii?Q?nVx0tnNFHkQA1LpEXUJHmIL7Sfm58oU3Y9Y+Lhr5THcdTJm4HHnXq/5wILbc?=
 =?us-ascii?Q?72/AKMSpaOv5zDdAdhlZAMzS+xF1hOxNUUdPaWd5S7SC2KgSSGTlpKJAf0Jf?=
 =?us-ascii?Q?ez4T6BPZQiKBskpBZWVijCdDqGwWZttJXCeHFjwBZyAB7CB4mThSBYAl4Ceb?=
 =?us-ascii?Q?54aBMvgPrf5JcA4jvHL5cc7aZXJljFUDRFsWxqKbwgVAsEx3WltT3g/2Xs1/?=
 =?us-ascii?Q?hpCFAt11RJ+P6uNNImW53X2Zf4eF5S4ojqMor/IIgq3y0YkG6v1WdVNlioSI?=
 =?us-ascii?Q?E+pZFoZbugCmEdlMby5v47kWOMnEucIftF2vLYo14oWFRHGRPefjxVmxxgOu?=
 =?us-ascii?Q?ofQlZPGiXmJbM+jyN/Z26hoVeivpxpTnZ4zhG8JoGvlWmviy1W/XbWaP+D9a?=
 =?us-ascii?Q?I3HR3UI7/JniM2Q6z/Jz33H2eOLrTRZTTGbDuRpspxwOKJY3OKBo0EikXljy?=
 =?us-ascii?Q?oZ7ovj9KE4oBi8ndQ4e50dQXEf6JwEedl9MQUpG2DgNQQIpOIbO2RhV0Q5l4?=
 =?us-ascii?Q?dPHFvTXTv9P/RQK3/6mBZ4yShwzUJ/pbIvH/Bq3Dof714QFxMdzDpIdpcAGj?=
 =?us-ascii?Q?q1pCftzhhpxEJ0YQ4RsYZsBTamlt8ow4gvra0qXtAWRIpkQQAbmsbAlmGcTK?=
 =?us-ascii?Q?FDOsb5EpXvkhpBH1+fDsvjn3jai4z+uvpFJdeMQWynOGKdrBKcpR7eV6GZWC?=
 =?us-ascii?Q?zKD0SIsEig=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	C0m7N52AhuZWBXf0qBULoj48NojcCdIdm1+9pp9frpnQjfzyKvStSpY5p55CSGLV2ZGYhvfgDiEIaLd/K6SAtzvX/0v5iQJpww2+SvIT5Xlkud3Nz0Z0DHH9cod3AhENxy5f9nUMCB/raVd/3mNb/TqX624N8bYLvN3Z90OkXEcT+thzIPC7Qz/3XQDtgVQRXspicFMrmGSk1Ue/IpCPN4q6gRwDgH2I+a7SCnVedmOQCOypIcPw5IrHC9wZY21O2IsTr0xqHwmadxN+PhAclFb3RP0SE+wxh7GrTDPnpgKkA8ZmZDQTWnnoQFwQ6pUEMPZtUUEn0IXHKcPQEBN6Zg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mo9AjrwzCNF+lwrCrmZ9xrO+GkERfiu+iNN5DQUx/YcOA2ObHHXmj3CRJOrgwPQ9RsB82xAKHooHSpIkAuibmPIsYOYBpdgBythIAOS3Zm2MrZf7WzMgNIoFPU+KLmZ25t+43PoyhqwV8g2WlE3eW+59HHiVGbDxopR4OImzJh7z2YX7AgjuNoR4/lr2wkU8ZFnhgTxNaAtkogcgHalZvhx8st7DrYiNwmjKv2WVZb7E5xfqPryS26TiuRJgNgbcvPE8UDWFKkbAnuPZooSiamucBslfOkSWJOnpkHS0+TWnM41zHrGYtOBX+QUUfTge4jaoPVs1GMmrvGkfdgl5hhK8/yHc3prnzGGVqzAvuPFny6QkvA8R4VCc1aS64ksQydIS/CwFcij3WlEJp8b5nrwUTtUr1ZhcCUrctxTnpMa2k5J8g0pzBakrIr7yt6JI+NVVw2E1uJX53GAz6/GmeH1t3xsxh9W31u2TrGKUHAc7EbbMBGr1JPMFZWzTCmlji2e2kvZdhaCokxiIl+DLqegcKyP2qo8KfoXqpt2xD0Gsgy/DxrIu+lPA16/SGPMT+NiRaUaTjRvj/Q+mR14wTe/3oIZJkcujV8TN/Mp1Qqs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e326bdba-5b73-4840-e5b1-08dec3681b1e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 01:08:23.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+deGFfx8pMd2dnxXAkSAN0ZesNk7RnxWqiIFqCStmcjG9SW+yJE/Z8ixzI3nc1KqcPtUIdhtHcxR+03p2//93y/7GLmjoT4Uo4SJtQ1pYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606060008
X-Authority-Analysis: v=2.4 cv=I6dVgtgg c=1 sm=1 tr=0 ts=6a23730d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=U162L89U_N8k6BLFsioA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 1ofyFKDlbwAT96cEme6MXHk6eIQRQL0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAwOCBTYWx0ZWRfX3cn6W67LCIl2
 vXPnXr5mTle8Zt7pwRWVHKKtahQ3ny0yhgm7Brn8MjbGfX32aEnL08vl77f+H0JnzJA18/7t7YB
 13F4vT7Y1RyHdmjwO4dyWNVHk+zV6dsqidygjvxpgG4qu0yyc9wSvAjEqrkFQnyJSi50HO3xI0F
 xUaMTkFOjjqAgNysSh9ZZNJdUqYvNAS7QtWZI1PLE4OilkiI4tTRQ9SCQshZPFXUgNqUjptf/No
 v2lH7i1OIHb00A/L+jLJAvNrd/fUvekh8LJh6MU0Bx1p4031MEnDnWn6ivtiWXiLdi7JJauIS/i
 trZkSydgw9YekY2XKLtuEv6s0SDoZgkeMDez+dY0nWgElKC005uhNOjB2PsxwzV8kcVMA3CH5v1
 r4TrSVSg3mR7eGRsiTVPhpfSvRBSXjbKlVZVc4mfpi4keXT+cNERvneFkSq+AzrRyvqzmHzT1q2
 MbxGLiJz3mfsUe5Qiyg==
X-Proofpoint-ORIG-GUID: 1ofyFKDlbwAT96cEme6MXHk6eIQRQL0-

A few initial comments:

- How is this different from what ``symbol or object``symbol would provide?
  (Yes, as far as I know it never got fully implemented but I think this might
   be similar to what you are doing, and perhaps it would be better to use the
   already documented syntax, and actually implement it more fully.)

- I think it is problematic that the cg code is making calls to a function in
  a particular provider.  THe architecture has been quite careful at avoiding
  breaking through that boundary.  I'm still digging a bit more through the
  code to determine exactly why that call is truly needed - it should not be
  necessary as far as I can see.

Resolution of a userspace symbol should essentially be a simple matter of:

	object-base-addr + symbol-offset

where the object is a particular mapping within the address space of the
current user process.

On Fri, Jun 05, 2026 at 11:12:15PM +0100, Alan Maguire via DTrace-devel wrote:
> Add uresolve(symbol[, fallback]) to resolve user-space symbols from D
> scripts.  uresolve() resolves a symbol to an object-relative offset at
> compile time, then computes the process-specific runtime address at probe
> fire time as:
> 
>     current uprobe IP - probe offset + symbol offset
> 
> For pid$target probes, use the target process and its /proc/<pid>/maps state
> to find the symbol and translate it to the same object-relative coordinate
> used by uprobes.  For system-wide uprobes, resolve the offset from the probed
> object file.  In both cases, address generation is shared and remains dynamic;
> the presence of a target process does not bake in an absolute address.
> 
> Use bpf_get_func_ip() when available so system-wide uprobes use the actual
> probed instruction address rather than a saved pt_regs IP that may contain
> the resume address.  Retain the saved-IP path as a fallback.
> 
> This allows scripts to locate process-local data such as
> _PyThreadState_Current across ASLR and across system-wide probes firing in
> different processes.  The optional fallback argument is returned when the
> symbol cannot be resolved; without it, resolution failure remains a
> compile-time error.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
> ---
>  include/dtrace/dif_defines.h |   3 +-
>  libdtrace/dt_bpf.c           |   1 +
>  libdtrace/dt_cg.c            | 456 +++++++++++++++++++++++++++++++++++
>  libdtrace/dt_open.c          |   2 +
>  libdtrace/dt_probe.h         |   1 +
>  libdtrace/dt_prov_uprobe.c   |  58 ++++-
>  6 files changed, 516 insertions(+), 5 deletions(-)
> 
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index edb98f06..63b8c293 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -213,8 +213,9 @@
>  #define DIF_SUBR_LINK_NTOP		45
>  #define DIF_SUBR_STACK			46
>  #define DIF_SUBR_USTACK			47
> +#define DIF_SUBR_URESOLVE		48
>  
> -#define DIF_SUBR_MAX			47
> +#define DIF_SUBR_MAX			48
>  
>  typedef uint32_t	dif_instr_t;
>  
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 146a66e3..aecd71d9 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -470,6 +470,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
>  	BPF_HELPER_MAP(probe_read_user_str, probe_read_str);
>  	BPF_HELPER_MAP(probe_read_kernel, probe_read);
>  	BPF_HELPER_MAP(probe_read_kernel_str, probe_read_str);
> +	BPF_HELPER_MAP(get_func_ip, unspec);
>  	BPF_HELPER_MAP(get_current_task_btf, unspec);
>  	BPF_HELPER_MAP(task_pt_regs, unspec);
>  #undef BPF_HELPER_MAP
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 1bd73e11..16c58e35 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -11,6 +11,9 @@
>  #include <setjmp.h>
>  #include <assert.h>
>  #include <errno.h>
> +#include <ctype.h>
> +#include <fcntl.h>
> +#include <unistd.h>
>  
>  #include <sys/socket.h>			/* needed for if_arp.h on OL7/x86 */
>  #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
> @@ -6988,6 +6991,458 @@ dt_cg_subr_link_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  	dt_regset_free(drp, type->dn_reg);
>  }
>  
> +static const char *
> +dt_cg_basename(const char *path)
> +{
> +	const char	*p;
> +
> +	p = strrchr(path, '/');
> +	return p != NULL ? p + 1 : path;
> +}
> +
> +static int
> +dt_cg_parse_objname(const char *mod, Lmid_t *lmidp, const char **objp)
> +{
> +	char	*end;
> +
> +	if (mod == NULL || mod[0] == '\0' || strisglob(mod))
> +		return -1;
> +
> +	if (strncmp(mod, "LM", 2) == 0 && isdigit((unsigned char)mod[2])) {
> +		*lmidp = strtoul(mod + 2, &end, 16);
> +		if (*end != '`' || end[1] == '\0' || strchr(end + 1, '`'))
> +			return -1;
> +
> +		*objp = end + 1;
> +		return 0;
> +	}
> +
> +	*lmidp = PR_LMID_EVERY;
> +	*objp = mod;
> +	return 0;
> +}
> +
> +static int
> +dt_cg_probe_objname(const dt_probe_t *prp, Lmid_t *lmidp, const char **objp)
> +{
> +	if (prp == NULL || prp->desc == NULL)
> +		return -1;
> +
> +	return dt_cg_parse_objname(prp->desc->mod, lmidp, objp);
> +}
> +
> +static int
> +dt_cg_obj_matches_path(const char *obj, const char *path)
> +{
> +	const char	*base;
> +	Lmid_t		lmid;
> +
> +	if (obj == NULL || path == NULL)
> +		return 0;
> +
> +	if (dt_cg_parse_objname(obj, &lmid, &obj) == -1)
> +		return 0;
> +
> +	base = dt_cg_basename(path);
> +	return strcmp(obj, path) == 0 || strcmp(obj, base) == 0;
> +}
> +
> +static int
> +dt_cg_elf_sym_to_offset(Elf *elf, const GElf_Sym *sym, uint64_t *offp)
> +{
> +	GElf_Ehdr	ehdr;
> +	size_t		i, phnum;
> +	uint64_t	base = 0;
> +
> +	if (sym->st_shndx == SHN_UNDEF ||
> +	    gelf_getehdr(elf, &ehdr) == NULL ||
> +	    elf_getphdrnum(elf, &phnum) != 0)
> +		return -1;
> +
> +	/*
> +	 * Match the object-relative coordinate used by uprobe offsets.  For
> +	 * ET_DYN, libproc computes file_dyn_base from the first PT_LOAD
> +	 * segment's page offset.  For ET_EXEC, the load bias is zero and the
> +	 * first segment's vaddr remains part of the object-relative offset.
> +	 */
> +	for (i = 0; i < phnum; i++) {
> +		GElf_Phdr	phdr;
> +
> +		if (gelf_getphdr(elf, i, &phdr) == NULL ||
> +		    phdr.p_type != PT_LOAD)
> +			continue;
> +
> +		if (ehdr.e_type == ET_EXEC)
> +			base = phdr.p_vaddr;
> +		else if (ehdr.e_type == ET_DYN && phdr.p_align != 0)
> +			base = phdr.p_vaddr & (phdr.p_align - 1);
> +
> +		break;
> +	}
> +
> +	if (i == phnum || sym->st_value < base)
> +		return -1;
> +
> +	*offp = sym->st_value - base;
> +	return 0;
> +}
> +
> +static int
> +dt_cg_elf_lookup_symtab(Elf *elf, int type, const char *name, GElf_Sym *symp)
> +{
> +	Elf_Scn		*scn = NULL;
> +
> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> +		GElf_Shdr	shdr;
> +		Elf_Data	*data;
> +		size_t		i, nsyms;
> +
> +		if (gelf_getshdr(scn, &shdr) == NULL ||
> +		    shdr.sh_type != type ||
> +		    shdr.sh_entsize == 0)
> +			continue;
> +
> +		data = elf_getdata(scn, NULL);
> +		if (data == NULL)
> +			continue;
> +
> +		nsyms = shdr.sh_size / shdr.sh_entsize;
> +		for (i = 0; i < nsyms; i++) {
> +			GElf_Sym	sym;
> +			const char	*s;
> +			uchar_t		stype;
> +
> +			if (gelf_getsym(data, i, &sym) == NULL ||
> +			    sym.st_name == 0 ||
> +			    sym.st_shndx == SHN_UNDEF)
> +				continue;
> +
> +			stype = GELF_ST_TYPE(sym.st_info);
> +			if (stype == STT_FILE || stype == STT_SECTION)
> +				continue;
> +
> +			s = elf_strptr(elf, shdr.sh_link, sym.st_name);
> +			if (s != NULL && strcmp(s, name) == 0) {
> +				*symp = sym;
> +				return 0;
> +			}
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static int
> +dt_cg_elf_lookup_offset(const char *path, const char *name, uint64_t *offp)
> +{
> +	GElf_Sym	sym;
> +	Elf		*elf = NULL;
> +	int		fd, rc = -1;
> +
> +	fd = open(path, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> +	if (elf == NULL || elf_kind(elf) != ELF_K_ELF)
> +		goto out;
> +
> +	if (dt_cg_elf_lookup_symtab(elf, SHT_SYMTAB, name, &sym) == -1 &&
> +	    dt_cg_elf_lookup_symtab(elf, SHT_DYNSYM, name, &sym) == -1)
> +		goto out;
> +
> +	rc = dt_cg_elf_sym_to_offset(elf, &sym, offp);
> +
> +out:
> +	if (elf != NULL)
> +		elf_end(elf);
> +	close(fd);
> +	return rc;
> +}
> +
> +typedef struct dt_cg_uresolve_arg {
> +	const char	*name;
> +	const char	*obj;
> +	int		explicit_obj;
> +	int		nmatches;
> +	int		no_path;
> +	int		no_symbol;
> +	int		bad_object;
> +	int		different_offset;
> +	uint64_t	off;
> +} dt_cg_uresolve_arg_t;
> +
> +static int
> +dt_cg_uresolve_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
> +{
> +	dt_cg_uresolve_arg_t	*uap = arg;
> +	const char		*path;
> +	uint64_t		off;
> +
> +	path = dt_probe_uprobe_path(prp);
> +	if (path == NULL) {
> +		uap->no_path = 1;
> +		return 1;
> +	}
> +
> +	if (uap->explicit_obj && !dt_cg_obj_matches_path(uap->obj, path)) {
> +		uap->bad_object = 1;
> +		return 1;
> +	}
> +
> +	if (dt_cg_elf_lookup_offset(path, uap->name, &off) != 0) {
> +		uap->no_symbol = 1;
> +		return 1;
> +	}
> +
> +	if (uap->nmatches++ == 0) {
> +		uap->off = off;
> +		return 0;
> +	}
> +
> +	if (uap->off != off) {
> +		uap->different_offset = 1;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +dt_cg_uresolve_from_probe_file(dt_node_t *dnp, dt_node_t *arg,
> +			       const char *name, const char *obj,
> +			       int explicit_obj, int allow_fallback,
> +			       uint64_t *offp)
> +{
> +	dt_cg_uresolve_arg_t	uarg = { 0 };
> +	dtrace_hdl_t		*dtp = yypcb->pcb_hdl;
> +
> +	uarg.name = name;
> +	uarg.obj = obj;
> +	uarg.explicit_obj = explicit_obj;
> +
> +	if (yypcb->pcb_pdesc != NULL)
> +		dt_probe_iter(dtp, yypcb->pcb_pdesc, dt_cg_uresolve_probe,
> +			      NULL, &uarg);
> +	else if (yypcb->pcb_probe != NULL)
> +		dt_cg_uresolve_probe(dtp, yypcb->pcb_probe, &uarg);
> +
> +	if (uarg.bad_object)
> +		dnerror(arg, D_PROC_NAME, "uresolve( ) object %s does not "
> +			"match the current uprobe object\n", obj);
> +	if (uarg.no_path)
> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) requires a unique "
> +			"uprobe object path for this probe\n");
> +	if (uarg.no_symbol) {
> +		if (allow_fallback)
> +			return -1;
> +
> +		dnerror(arg, D_PROC_FUNC, "failed to resolve user symbol %s "
> +			"in the current uprobe object\n", arg->dn_string);
> +	}
> +
> +	if (uarg.nmatches == 0) {
> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) cannot determine the "
> +			"current uprobe object\n");
> +	}
> +
> +	if (uarg.different_offset)
> +		dnerror(arg, D_PROC_FUNC, "uresolve( ) matched multiple "
> +			"uprobe objects with different offsets for symbol %s\n",
> +			arg->dn_string);
> +
> +	*offp = uarg.off;
> +	return 0;
> +}
> +
> +static int
> +dt_cg_uresolve_from_target(dt_node_t *dnp, dt_node_t *arg, pid_t pid,
> +			   Lmid_t lmid, const char *obj, const char *name,
> +			   int allow_fallback, uint64_t *offp)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +	const prmap_t	*mapp, *first;
> +	GElf_Sym	sym;
> +	pid_t		gpid;
> +	int		err = 0;
> +
> +	gpid = dt_proc_grab_lock(dtp, pid,
> +	    DTRACE_PROC_WAITING | DTRACE_PROC_SHORTLIVED);
> +	if (gpid <= 0)
> +		dnerror(dnp, D_PROC_GRAB, "failed to grab target process %d "
> +			"for uresolve( )\n", pid);
> +
> +	if (dt_Pxlookup_by_name(dtp, gpid, lmid, obj, name,
> +	    &sym, NULL) != 0) {
> +		err = 1;
> +	} else if ((mapp = dt_Paddr_to_map(dtp, gpid, sym.st_value)) == NULL ||
> +	    mapp->pr_file == NULL ||
> +	    (first = mapp->pr_file->first_segment) == NULL ||
> +	    sym.st_value < first->pr_vaddr) {
> +		err = 1;
> +	} else {
> +		*offp = sym.st_value - first->pr_vaddr;
> +	}
> +
> +	dt_proc_release_unlock(dtp, gpid);
> +
> +	if (err == 0)
> +		return 0;
> +
> +	if (allow_fallback)
> +		return -1;
> +
> +	dnerror(arg, D_PROC_FUNC, "failed to resolve target user symbol %s\n",
> +		arg->dn_string);
> +}
> +
> +static void
> +dt_cg_uresolve_emit_offset_addr(dt_node_t *dnp, dt_irlist_t *dlp,
> +				dt_regset_t *drp, uint64_t symoff)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +	int	treg;
> +
> +	/*
> +	 * Compute the current object base from the saved user PC and the
> +	 * uprobe offset, then add the compile-time-resolved symbol offset.
> +	 * When available, use the kernel's current uprobe IP directly because
> +	 * the saved register block may not reliably carry the breakpoint
> +	 * address for system-wide uprobes across different processes.
> +	 */
> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
> +		if (dt_regset_xalloc_args(drp) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +		if (dt_regset_xalloc(drp, BPF_REG_0) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +		dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
> +		dt_regset_free_args(drp);
> +
> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +		emit(dlp, BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
> +		dt_regset_free(drp, BPF_REG_0);
> +	} else {
> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +		if ((treg = dt_regset_alloc(drp)) == -1)
> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +		dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
> +		emit(dlp, BPF_LOAD(BPF_DW, dnp->dn_reg, treg,
> +				   DMST_REGS + PT_REGS_IP));
> +		dt_regset_free(drp, treg);
> +	}
> +
> +	if ((treg = dt_regset_alloc(drp)) == -1)
> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +	dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
> +	emit(dlp, BPF_LOAD(BPF_DW, treg, treg, DMST_PROFF));
> +	emit(dlp, BPF_ALU64_REG(BPF_SUB, dnp->dn_reg, treg));
> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, treg, symoff);
> +	emit(dlp, BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, treg));
> +
> +	dt_regset_free(drp, treg);
> +}
> +
> +static void
> +dt_cg_subr_uresolve(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +	dt_node_t	*arg = dnp->dn_args;
> +	dt_node_t	*fallback;
> +	dt_ident_t	*tidp;
> +	pid_t		pid = 0;
> +	char		*spec, *tick;
> +	const char	*obj = NULL;
> +	const char	*name;
> +	Lmid_t		lmid = PR_LMID_EVERY;
> +	uint64_t	off = 0;
> +	int		err = 0, explicit_obj = 0;
> +	int		use_fallback = 0;
> +
> +	if (arg == NULL || (arg->dn_list != NULL &&
> +	    arg->dn_list->dn_list != NULL))
> +		dnerror(dnp, D_PROTO_LEN, "uresolve( ) prototype mismatch: "
> +			"expected 1 or 2 arguments\n");
> +
> +	if (arg->dn_kind != DT_NODE_STRING)
> +		dnerror(arg, D_PROTO_ARG, "uresolve( ) argument #1 must be "
> +			"a string constant\n");
> +
> +	fallback = arg->dn_list;
> +	tidp = dt_idhash_lookup(dtp->dt_macros, "target");
> +	if (tidp != NULL)
> +		pid = tidp->di_id;
> +
> +	spec = strdup(arg->dn_string);
> +	if (spec == NULL)
> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> +
> +	tick = strrchr(spec, '`');
> +	if (tick != NULL) {
> +		*tick = '\0';
> +		obj = spec;
> +		name = tick + 1;
> +		explicit_obj = 1;
> +
> +		if (*obj == '\0' || *name == '\0')
> +			err = 1;
> +	} else {
> +		name = spec;
> +	}
> +
> +	if (err != 0) {
> +		free(spec);
> +		dnerror(arg, D_PROC_NAME, "uresolve( ) argument must be "
> +			"\"symbol\" or \"object`symbol\"\n");
> +	}
> +
> +	if (pid == 0) {
> +		if (dt_cg_uresolve_from_probe_file(dnp, arg, name, obj,
> +		    explicit_obj, fallback != NULL, &off) != 0)
> +			use_fallback = 1;
> +		goto done;
> +	}
> +
> +	if (explicit_obj) {
> +		if (dt_cg_parse_objname(obj, &lmid, &obj) != 0) {
> +			free(spec);
> +			dnerror(arg, D_PROC_NAME, "uresolve( ) object %s is "
> +				"not a valid user object name\n", arg->dn_string);
> +		}
> +	} else if (dt_cg_probe_objname(yypcb->pcb_probe, &lmid, &obj) != 0) {
> +		const char	*path = dt_probe_uprobe_path(yypcb->pcb_probe);
> +
> +		if (path != NULL) {
> +			obj = path;
> +			lmid = PR_LMID_EVERY;
> +		} else {
> +			free(spec);
> +			dnerror(arg, D_PROC_NAME, "unqualified uresolve( ) "
> +				"requires a concrete probe module\n");
> +		}
> +	}
> +
> +	if (dt_cg_uresolve_from_target(dnp, arg, pid, lmid, obj, name,
> +	    fallback != NULL, &off) != 0)
> +		use_fallback = 1;
> +
> +done:
> +	free(spec);
> +
> +	if (use_fallback) {
> +		dt_cg_node(fallback, dlp, drp);
> +		dnp->dn_reg = fallback->dn_reg;
> +	} else
> +		dt_cg_uresolve_emit_offset_addr(dnp, dlp, drp, off);
> +}
> +
>  typedef void dt_cg_subr_f(dt_node_t *, dt_irlist_t *, dt_regset_t *);
>  
>  static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> @@ -7039,6 +7494,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
>  	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
>  	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
> +	[DIF_SUBR_URESOLVE]		= &dt_cg_subr_uresolve,
>  };
>  
>  static void
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index ca00788a..0505e2ff 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -330,6 +330,8 @@ static const dt_ident_t _dtrace_globals[] = {
>  	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
>  { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
>  	&dt_idops_regs, NULL },
> +{ "uresolve", DT_IDENT_FUNC, 0, DIF_SUBR_URESOLVE, DT_ATTR_STABCMN,
> +	DT_VERS_2_0, &dt_idops_func, "uintptr_t(string, [uintptr_t])" },
>  { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
>  	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
>  { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> index 54053cd3..bff47055 100644
> --- a/libdtrace/dt_probe.h
> +++ b/libdtrace/dt_probe.h
> @@ -102,6 +102,7 @@ typedef int dt_dependent_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
>  extern int dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  				   dt_dependent_f *func, void *arg);
>  
> +extern const char *dt_probe_uprobe_path(const dt_probe_t *prp);
>  
>  extern void dt_probe_init(dtrace_hdl_t *dtp);
>  extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index d53b1e43..9a481f59 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -307,6 +307,47 @@ typedef struct uprobe_data {
>  	int	ref_shift;
>  } uprobe_data_t;
>  
> +dt_provimpl_t	dt_pid;
> +dt_provimpl_t	dt_usdt;
> +dt_provimpl_t	dt_stapsdt;
> +
> +const char *
> +dt_probe_uprobe_path(const dt_probe_t *prp)
> +{
> +	const dt_uprobe_t	*upp;
> +	const list_probe_t	*pup;
> +	const char		*path = NULL;
> +
> +	if (prp == NULL || prp->prov == NULL)
> +		return NULL;
> +
> +	if (prp->prov->impl == &dt_uprobe) {
> +		upp = prp->prv_data;
> +		return upp != NULL ? upp->fn : NULL;
> +	}
> +
> +	if (prp->prov->impl != &dt_pid &&
> +	    prp->prov->impl != &dt_usdt &&
> +	    prp->prov->impl != &dt_stapsdt)
> +		return NULL;
> +
> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +		if (pup->probe == NULL || pup->probe->prv_data == NULL)
> +			return NULL;
> +
> +		upp = pup->probe->prv_data;
> +		if (upp->fn == NULL)
> +			return NULL;
> +
> +		if (path == NULL)
> +			path = upp->fn;
> +		else if (strcmp(path, upp->fn) != 0)
> +			return NULL;
> +	}
> +
> +	return path;
> +}
> +
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -315,10 +356,6 @@ static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>  };
>  
> -dt_provimpl_t	dt_pid;
> -dt_provimpl_t	dt_usdt;
> -dt_provimpl_t	dt_stapsdt;
> -
>  #define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
>  #define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
>  #define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
> @@ -1392,6 +1429,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 */
>  	dt_cg_tramp_copy_regs(pcb);
>  
> +	/*
> +	 * On some architectures the saved user IP in the uprobe pt_regs is the
> +	 * resume address rather than the probed instruction address.  Normalize
> +	 * the saved IP to the actual uprobe address when the kernel can provide
> +	 * it so consumers such as uresolve() can derive the correct object base.
> +	 */
> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
> +		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7,
> +				    DMST_REGS + PT_REGS_IP, BPF_REG_0));
> +	}
> +
>  	/*
>  	 * Record the uprobe instrumentation offset in the probe context.
>  	 * This is the same object-relative offset passed to perf_event_open()
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
