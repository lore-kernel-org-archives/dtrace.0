Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE2B1E1C05
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147676; cv=fail; b=PNjwJzRxfZmSjDP07/YLnYUdGEDHdTMEas4+VLu834bbpye3AkutDCtQrySOnQL/4DqqMhVg8lM/8nDKCEfnRqN5OzNVakC8/9Lc5iICELxaqjmQMe3AHxM8e1ch/fsyq7CH0L5vjWGinAvOmkWImkoOZZsK35lWldjin5cOeOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147676; c=relaxed/simple;
	bh=eznDMbJL0x9iNHkbzjvaahm92g6Pbs8byd/ah52WiG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SsRiaq7uq6A/2JZO1Xx9gmsGpUzvIp0EQ5hyk3xMoTQgIZPeGYtSMcHzuub723FrHm3RTcvn2dF/uIgoA6PvBad9EuzmSdOCCT8f5xLP4RbXrh2Hnek10fvnfPw2o3Mv7yMmajDJKSVusosJRTzi9Wm4L32DM4qo6lbT6WbERH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=buhfM2V7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HmV/xEwv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="buhfM2V7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HmV/xEwv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtaiZ007135
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=TeGYfyuMBBGSdG273l
	Bjk8XksSR+Z+G2tdssWJvdg9Q=; b=buhfM2V72019I6DwRG6sd705yYCAMU0P3s
	ny3sZ/MZoTyiWklIdAKdD9eKQ0jdv0IzK00TdjRSOnet275b9qySv89LHoMq11pK
	lPgFMgc7UNcweIamwE8MwH4YZlxmeY0tzCst5xVSjqozpmIZF1fFnGLP91T6xo9j
	/XlCEpnR/J21UntBLdglgP1TNRe3P27dZDz/N5GIJI0DUb3icyTcR/WjdSi4owMT
	v2nWsV5jKCL+G2vOrmntgYU8Z1iCsBJhTsOeu55QZnAcJmsSU1H+PMGtcj4fjfqV
	fLRfMYsWqD36sScQ2uEKQg3TcpwcmuCOLeWYOZUzTvbmAJk4hRiQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmbwmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:34:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SK9p16010991
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:34:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8vs8bp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:34:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmVgxcveXeBs6qU4/lm87Z3xZIwY1j1tYNrPXUNnbyD7TCdb6LGoQAv2X6ucpl1sqvKk2e4Sqgd1rLP+vkag5AK3JZtzk5Rq3pX99Thhw1ynPm7+TisoeLQ7W70st/5yIo1CHKtS1O+tM0Q783U9oqdUyQ2tae5XmIpPvziS7Uvjb5R1ob53i2Thc1wHFilCm/kNIRDjj0QcDs11z4kUnfekQI3/9N395OxJSKC5QIzbsle7U/U19sdTFaEMBky4TGEPmDtp7s0mK1cim5eh0hZRjT+gPG5vhWVUrl/C9+Ura/a2d16SQ1TDpev17dH+xN64LIOdhlgdzeIx6i27mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeGYfyuMBBGSdG273lBjk8XksSR+Z+G2tdssWJvdg9Q=;
 b=u184HqpKaq+fPkmetnu0NhwAuWwlFD2YqtzqK8nvublOqeOyf9oxU9qlq5Z4sosP6X0SZpi5vhJmwliBKH4k64VTcKLUq+beTwMKaskG19QrBb9WWi3GWYktgbtzj68I3oWQ9hp0OOslZSqD4SvECercH9lNZ7qhQh4eUiq0607yybSl9+qq4mz5bUtnPMXmJMjjQ/RYuggCwdHKWRFw5mIaLK58HbB7er309Y4iapRKaz2BU0dSDyWfsNd7dVPgMlgiOgoLzwHQWM6XV+4F38dVdtxaWphTV/VWI1agSleESe1DJ5IfXMhnuBv1AXawfX/uaNvNBLj/L7xZxpQUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeGYfyuMBBGSdG273lBjk8XksSR+Z+G2tdssWJvdg9Q=;
 b=HmV/xEwv/vE91yTE0rdTgxebMwJIt/p9yHeiEp8oTA+UmfdgV9NGnKZiMA7WZavSNXG2SJBPAgaQ1R035tUdYS/bUjLx0oStKRPJgeeNHjhat7iG18QpZFfj9Y0P6FGo22jPXkiJ4JaCPdgjmitZz0Rr63KS5n+WVZ0tLJOQH4E=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CO1PR10MB4676.namprd10.prod.outlook.com (2603:10b6:303:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 20:34:27 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 20:34:27 +0000
Date: Mon, 28 Oct 2024 16:34:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 5/6] test: Add USDT tests for deferred detection
Message-ID: <Zx_1UalvZnrxbbJ4@kvh-deb-bpf.us.oracle.com>
References: <20241009222613.5553-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009222613.5553-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BY5PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:180::26) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CO1PR10MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: d44e8ef4-628e-4a48-7356-08dcf78feac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z16bLQzWdtOc96JRs3VZ1tQONX/6DTU2HFi0kHAYEDGlPneOIYwe48Lvf6vN?=
 =?us-ascii?Q?d/3lvTgTjqgTdxSYvCKXbT7yCKSzooxA/+cewz9d7fnec4/MzvYHC9aTCDlr?=
 =?us-ascii?Q?hfnxt/2bFhYrekoEb9fQ4iIiBjorK/6K6INcHFEJ091r83EjVh4Ce61zDBu/?=
 =?us-ascii?Q?X5wCkPAmw69Zw0VtY/oEW+7Gv2Vuxt+310ochAig09HGeSfK+aLPOXqSrBRB?=
 =?us-ascii?Q?ot4wAjHx3jvRbTPqpK2uO6UOipXLQFeH3oD0uzjqQDnwifNn4FhislWjIbZj?=
 =?us-ascii?Q?XOEEidDMt33CWbPdU1qF281LK0htS96c+I0fCT+knCqEyFmdLQVMWbphyg01?=
 =?us-ascii?Q?rWv/VfvtrpQ7SntUFj2nmTGTyLaxWRK8Mgfy01rHrFLQX7PeWxUL91aR/qzn?=
 =?us-ascii?Q?BWEW4ka27oalG7n12gVJ6XuXNcwiI/Pc6egWEUOq+rGltS5ocWGimydClCEQ?=
 =?us-ascii?Q?Y+FPlXO/FqoRTTsRGVgepUX/t2in2f3NK4zT26Jow43kGgR8yDnMs62/JKD7?=
 =?us-ascii?Q?I2AXAivhs0a/zrlsyaCvBbBZ62KYuBLyoJBc20ODLVSCDHJvpyZy/tXWY+oj?=
 =?us-ascii?Q?DC+8YKGqLchjLISJH/xwvJv6LPjMxjwRRZcafbid09WWzSHKDyP9kHIbtER8?=
 =?us-ascii?Q?eLBmQL1a/xWK/CSKEKNVVMKiRPHbdFQ73InSZ9cflmhPnsgnbABIRDmKmYSb?=
 =?us-ascii?Q?gwl1Pi/IrSdE3mQgKkfTNgWbMHh99e0YsdRpmzvWxW9wvAHmn7ffm6JC4s24?=
 =?us-ascii?Q?bu0etgRQ/9F5nJkTmyoWfLkn00oTUmUkRcjuQnwudpGE8XpTHzO8fJQ6bm7m?=
 =?us-ascii?Q?sobcydsBfRXoHbtlAqFfhdLaGg0k6yKVibChU6lryyGAHrpOjLYuxzteNFgQ?=
 =?us-ascii?Q?CSVkjRPgOHkP7j6pfHmAw7OeEyAhPQe8SKGZ6LEuKwSkPOBduQQTCJK8bWLt?=
 =?us-ascii?Q?9KtUnth8s33IArsfKoHqQjZjvisAgrSY9BisTlMV0u2YaUyNdcdO+tEO0ViN?=
 =?us-ascii?Q?MGsgdtJlse+A6aQtL+azlLK0R3nr0ETlTkOoznJbQhvshG4ssqTaIeasyJ7G?=
 =?us-ascii?Q?hwiGUK9/cI2dlxGdeMNb1UYoyDb+9ZkO8XWhRBsMamxJypC7K5O6CEmRQUp6?=
 =?us-ascii?Q?2LpnCmqzWR2PBNIob6loxhIwJbSrr5RAMhSZCe66XOiNz0YSzUYfJfiZCy4u?=
 =?us-ascii?Q?L3naZYFQgkauUHGAe5p8BOI8lOT7rHuB+RI9oyDrQNqdmwjs9qYOjueWn9rh?=
 =?us-ascii?Q?CX/1B1uwmNLMH0DeXRRKheejA4GnBGKXxoKOQ95LhBbyYhDrBB+VnzoQWRy0?=
 =?us-ascii?Q?x4t/tC6wyglWub26fKGnk92l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pl2VhZsDDIZYSrhWugNiS90QqMUEQ73rCuE8gla6YcqMFi/ZvZXbjXMOFlkl?=
 =?us-ascii?Q?5EDejf3Xo/LJcwYKcAXbqAlxx1Xafx49eviodpU3KhmBKQ6kXutktL2ykHHy?=
 =?us-ascii?Q?zIyeYHTxwLtGSZYW3pYo8M1n6W7NNx6g+EKb98IO1esBwUX3TC8NhlloFea6?=
 =?us-ascii?Q?/3FwYeMa/cI2ZjT/DgemLs/yHqbUMfZKMmzwaEkRUWvvLFNYq59YK9idEb2P?=
 =?us-ascii?Q?GXNhD+zqY8o2SAFSdsfjG9JAyIS36VHyyY7gujRcBfhXJaO1r8V1BchRMoCw?=
 =?us-ascii?Q?Bae2hWCKpoM6zjPcfExQSVgDX6Un9C+cmc5f2e1Vl55nyCT7Sk7J3ZIr5ojp?=
 =?us-ascii?Q?K926PX5Bvf0S2Fxpts8m9zVRYrhneN/Dka6Zx//EvykuiWQDM/EBVmSxnzTC?=
 =?us-ascii?Q?Huasor8bpCQGREM5U0sZ0GIBHl/agDPd4wyampeXbZHm+9G3+YCTCQhj5SUQ?=
 =?us-ascii?Q?oYRTsIMqTpGrPD2JT0Fppj6TYr7Nf3f92ZO1ijOpOGqAl/B39ThSPKvmUrpL?=
 =?us-ascii?Q?0FhcXfp6/xwxdJj4Tbzf9xhl5InIh1DVXrjUlqeRS7FF0BLVEV9bnslS2FfW?=
 =?us-ascii?Q?Nhevh4Ie/XYtvWINxaczyAPp9yvnswLy60lgndF/MkGTsDB1LXD3kDqcpZ21?=
 =?us-ascii?Q?noVUtuJnKFvjZvji/hfxGvSdxBIv0zrg9N6tNsmQ8nZohrwIfOk18U6XpnmG?=
 =?us-ascii?Q?Smn+xG0QlybF7lZZoVkBkCTyOF6ezd2mkb9rBdJFs7lsO9Y6r18n7WpWttDz?=
 =?us-ascii?Q?zAiHlIYdpS1UEn/lJJ5Be6qj9Re7yFYEUOcKoydHJmFby37PM7S5eyWZc5Rd?=
 =?us-ascii?Q?/qmEP1RGVoFSzLAPWKCWaLBYwFRIRORgN6O2Y0Yj4joglGC+UQWe1INzw1Bw?=
 =?us-ascii?Q?HId7RsK5IeOwlI4fpW2aVAA9P/GSWDIC3GHBsXTfB/za1jka5eJPTbp7A0FW?=
 =?us-ascii?Q?CFqyRbZ5mPoIWuxlmSk+zjX/uhh6k6KEoZcvXoERBHxjOLhYdkggA2nn0X6n?=
 =?us-ascii?Q?YBgYS4ZTKXu55YlIR1UHKIFaUp8qqEqT4iNtafbedXif+lTOZqPZt8bWNN9G?=
 =?us-ascii?Q?3Da+xvpTKv9H5eLEUojda4z1UPbN3hlidHwmmmVCeltDz3vIRsrf5wKtvmGn?=
 =?us-ascii?Q?IhigPm0Yng9v1/nn/xcYeJIIFpMAMt2kWiaCBUeGsip7i5MwBfT3CsqWM15z?=
 =?us-ascii?Q?ZY6Tc9IpVMlhd/qJa4gZvbB5SdyXthWNVSDzjQwiNzSncGkkb3Wv3wjzuQzE?=
 =?us-ascii?Q?GlwFBehZBiZv21Jwj17q4dFOhlbPPbAcjIU8Ea0zE2q/gHiORipi2OsbJp7t?=
 =?us-ascii?Q?LEZY14FqCp5pjwINW0RcdapEgsDD5sy40ZWF5kXueFyPoyEXkLY+Chis8wEG?=
 =?us-ascii?Q?54rkiJYXQXZt+JKKO/rs5ZimfaNEpRnut10/SB24/uxbVg/d52Z2bI1cccsr?=
 =?us-ascii?Q?dPmCGXNlSIr/NDvKshl1a3ecHrc+MO3tHqAZ/tuxneBjshvTy//WRKsJsD9i?=
 =?us-ascii?Q?WAWcFYc6f32wI9k+gqJGlTi4iV5FGpMY7GVVZv27aFFDcgeJX78D3nSoLqu/?=
 =?us-ascii?Q?m6sYXfvMUk+PgijURJzTF4pz7SBkhV843UQeIhppppyHpFcqL3IcaEClWWS4?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C7cdvKKvqBxqRf+3g8hN4eVqOZrTlqaWZpKDWc5jWjb8FpH6dZzS3G10EYste+QQFxzHwa4lIX8lKNHZzHtI+F6AWmCVD3GEx7ueWsSig3tTX04af7uMNmM0ByqHH0V70jgkxvfilgwqvv/IpmTorKW1P29RLWv3lH5OZvv+8d9c+W1GpNuKoXJdUsY4VtSCQFZ0e12l6lS3b3NgggVLw206nqz8QjDiYN4t5v2L/IjFa1uQGTLZpN/lLH3RenuYgvxJo4uDrz8+MsluW0vs0PlCCY+baq9ww3WHYuEYx7mc54qMt9gbEWNryoAa5mqFEKn8hnE8futnYrlLQAb0I7rv6eKko1KxclqP+LQP+yBiU3yVulOypr1K1SDZ8TQpb0TrPXcrjc8zI9M9Rp/oKHD5dzrX9NiFlMQzlhSwfb1ArdFwktHdPjv4wUhMHLBGNchuUy124DgCRKVj5hi8IYgpBOlZ4mm1Pt6Az3g5Up5M4jS7g2xK5wxKugt5+naWBAjTHOF2LlFLipTbq2N/XM8ayNeXb2rwiNBWrW5B0kdJIa48nCmeY+KAHX+Hd0HoXIDSmpb0iMKWaLAXrgtzI1o6SYRuDBUEYFvFX93bRoc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44e8ef4-628e-4a48-7356-08dcf78feac0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:34:27.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cm9xGzx27j9sjyLkFA/mX0VVDmpzWXd38c5mdAx1nmXWAeNmU4JP6n10LwyGY2Yh/52EQeg8BVuFx9YrfkK9WXq703Basy4Puyh6hRI200=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4676
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280160
X-Proofpoint-GUID: cNElbV1zuu4_uj3deJBz2R9scmXIAlF2
X-Proofpoint-ORIG-GUID: cNElbV1zuu4_uj3deJBz2R9scmXIAlF2

On Wed, Oct 09, 2024 at 06:26:13PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> When new USDT processes start up, we do not immediately trace
> them.  First, dtprobed has to see these processes and then dtrace
> has to find them.  Hence, many of our tests XFAIL.
> 
> Add some tests that check USDT tracing on processes that start
> after the dtrace session has started, allowing for the possibility
> that tracing does not start until after the trigger is already
> underway.
> 
> There are two cases to consider.  One is when there is a USDT
> process running when the dtrace session starts.  In this case,
> an underlying probe is attached and later USDT processes just
> get added on.  Another case is when no USDT processes are running
> when the dtrace session starts.  In this case, -Z must be specified,
> and the underlying probe will not be attached until one of the USDT
> processes is detected.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.defer-Z.r  |   1 +
>  test/unittest/usdt/tst.defer-Z.sh | 153 ++++++++++++++++++++++++++++
>  test/unittest/usdt/tst.defer.r    |   1 +
>  test/unittest/usdt/tst.defer.sh   | 160 ++++++++++++++++++++++++++++++
>  4 files changed, 315 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.defer-Z.r
>  create mode 100755 test/unittest/usdt/tst.defer-Z.sh
>  create mode 100644 test/unittest/usdt/tst.defer.r
>  create mode 100755 test/unittest/usdt/tst.defer.sh
> 
> diff --git a/test/unittest/usdt/tst.defer-Z.r b/test/unittest/usdt/tst.defer-Z.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.defer-Z.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
> new file mode 100755
> index 000000000..52e92eb6b
> --- /dev/null
> +++ b/test/unittest/usdt/tst.defer-Z.sh
> @@ -0,0 +1,153 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT will see new processes, even if detection
> +# is deferred -- that is, DTrace does not know about a new USDT process
> +# until after it's started running.
> +#
> +# In this test, all processes are started after the DTrace session has started.
> +# So the USDT probes will not be recognized at first and -Z must be used.
> +
> +dtrace=$1
> +trigger=`pwd`/test/triggers/usdt-tst-defer
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/defer-Z.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make a private copy of the trigger executable so that we get our
> +# own DOF stash.
> +
> +cp $trigger main
> +
> +# Start dtrace.
> +
> +$dtrace $dt_flags -Zwq -o dtrace.out -n '
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +}
> +testprov*0:::bar,
> +testprov*1:::bar,
> +testprov*2:::bar,
> +testprov*3:::bar,
> +testprov*4:::bar
> +{
> +	@[pid, 0] = sum(arg0);
> +	@[pid, 1] = sum(arg1);
> +	@[pid, 2] = sum(arg2);
> +	@[pid, 3] = sum(pid % 100);
> +}' &
> +dtpid=$!
> +sleep 2
> +if [[ ! -d /proc/$dtpid ]]; then
> +	echo ERROR dtrace died
> +	exit 1
> +fi
> +
> +# Start processes concurrently.
> +
> +num=10
> +i=0
> +while [ $i -lt $num ]; do
> +	./main > main.out$i &
> +	pids[$i]=$!
> +	i=$(($i + 1))
> +done
> +
> +# Confirm that dtrace is still running (otherwise triggers run forever).
> +sleep 2
> +if [[ ! -d /proc/$dtpid ]]; then
> +	echo ERROR dtrace died after triggers started
> +	i=0
> +	while [ $i -lt $num ]; do
> +		kill -USR1 ${pids[$i]}
> +		wait       ${pids[$i]}
> +		i=$(($i + 1))
> +	done
> +	exit 1
> +fi
> +
> +# Wait for processes to complete.
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	wait ${pids[$i]}
> +	i=$(($i + 1))
> +done
> +
> +# Kill the dtrace process.
> +
> +kill $dtpid
> +wait
> +
> +# Check the program output (main.out$i files).
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	if [ $((${pids[$i]} % 10)) -lt 5 ]; then
> +		nphase2bar=10
> +	else
> +		nphase2bar=0
> +	fi
> +	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
> +	awk '
> +	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
> +	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
> +	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
> +	if ! diff -q main.out$i.post main.out$i.expected; then
> +		echo program output looks wrong for DTrace case $i
> +		echo === was ===
> +		cat main.out$i
> +		echo === got ===
> +		cat main.out$i.post
> +		echo === expected ===
> +		cat main.out$i.expected
> +		exit 1
> +	fi
> +	i=$(($i + 1))
> +done
> +
> +# Check the dtrace output.
> +
> +#     regularize the dtrace output
> +awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
> +
> +#     determine what to expect
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	if [ $((${pids[$i]} % 10)) -lt 5 ]; then
> +		x=$(((${pids[$i]} % 100) * 10))
> +		echo ${pids[$i]} 0 45 >> dtrace.out.expected
> +		echo ${pids[$i]} 1 65 >> dtrace.out.expected
> +		echo ${pids[$i]} 2 90 >> dtrace.out.expected
> +		echo ${pids[$i]} 3 $x >> dtrace.out.expected
> +	fi
> +
> +	i=$(($i + 1))
> +done
> +
> +#     diff
> +if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
> +	echo dtrace output looks wrong for DTrace case $i
> +	echo === was ===
> +	cat dtrace.out
> +	echo === got ===
> +	cat dtrace.out.post
> +	echo === expected ===
> +	sort dtrace.out.expected
> +	echo === diff ===
> +	sort dtrace.out.expected | diff - dtrace.out.post
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
> diff --git a/test/unittest/usdt/tst.defer.r b/test/unittest/usdt/tst.defer.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.defer.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
> new file mode 100755
> index 000000000..02ed1a767
> --- /dev/null
> +++ b/test/unittest/usdt/tst.defer.sh
> @@ -0,0 +1,160 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT will see new processes, even if detection
> +# is deferred -- that is, DTrace does not know about a new USDT process
> +# until after it's started running.
> +#
> +# In this test, a process is started before the DTrace session has started.
> +# So the USDT probes will be recognized at first and -Z need not be used.
> +
> +dtrace=$1
> +trigger=`pwd`/test/triggers/usdt-tst-defer
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/defer.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make a private copy of the trigger executable so that we get our
> +# own DOF stash.
> +
> +cp $trigger main
> +
> +# Start one process.
> +
> +./main > main.out0 &
> +pids[0]=$!
> +i=1
> +
> +# Figure out the pid's trailing digit.
> +
> +lastdigit=$((${pids[0]} % 10))
> +
> +# Start dtrace.
> +
> +$dtrace $dt_flags -wq -o dtrace.out -n '
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +}
> +testprov*'$lastdigit':::bar
> +{
> +	@[pid, 0] = sum(arg0);
> +	@[pid, 1] = sum(arg1);
> +	@[pid, 2] = sum(arg2);
> +	@[pid, 3] = sum(pid % 100);
> +}' &
> +dtpid=$!
> +sleep 2
> +if [[ ! -d /proc/$dtpid ]]; then
> +	echo ERROR dtrace died
> +	kill -USR1 ${pids[0]}
> +	wait       ${pids[0]}
> +	exit 1
> +fi
> +
> +# Start remaining processes.
> +
> +num=10
> +while [ $i -lt $num ]; do
> +	./main > main.out$i &
> +	pids[$i]=$!
> +	i=$(($i + 1))
> +done
> +
> +# Confirm that dtrace is still running (otherwise triggers run forever).
> +sleep 2
> +if [[ ! -d /proc/$dtpid ]]; then
> +	echo ERROR dtrace died after triggers started
> +	i=0
> +	while [ $i -lt $num ]; do
> +		kill -USR1 ${pids[$i]}
> +		wait       ${pids[$i]}
> +		i=$(($i + 1))
> +	done
> +	exit 1
> +fi
> +
> +# Wait for processes to complete.
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	wait ${pids[$i]}
> +	i=$(($i + 1))
> +done
> +
> +# Kill the dtrace process.
> +
> +kill $dtpid
> +wait
> +
> +# Check the program output (main.out$i files).
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
> +		nphase2bar=10
> +	else
> +		nphase2bar=0
> +	fi
> +	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
> +	awk '
> +	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
> +	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
> +	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
> +	if ! diff -q main.out$i.post main.out$i.expected; then
> +		echo program output looks wrong for DTrace case $i
> +		echo === was ===
> +		cat main.out$i
> +		echo === got ===
> +		cat main.out$i.post
> +		echo === expected ===
> +		cat main.out$i.expected
> +		exit 1
> +	fi
> +	i=$(($i + 1))
> +done
> +
> +# Check the dtrace output.
> +
> +#     regularize the dtrace output
> +awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
> +
> +#     determine what to expect
> +
> +i=0
> +while [ $i -lt $num ]; do
> +	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
> +		x=$(((${pids[$i]} % 100) * 10))
> +		echo ${pids[$i]} 0 45 >> dtrace.out.expected
> +		echo ${pids[$i]} 1 65 >> dtrace.out.expected
> +		echo ${pids[$i]} 2 90 >> dtrace.out.expected
> +		echo ${pids[$i]} 3 $x >> dtrace.out.expected
> +	fi
> +
> +	i=$(($i + 1))
> +done
> +
> +#     diff
> +if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
> +	echo dtrace output looks wrong for DTrace case $i
> +	echo === was ===
> +	cat dtrace.out
> +	echo === got ===
> +	cat dtrace.out.post
> +	echo === expected ===
> +	sort dtrace.out.expected
> +	echo === diff ===
> +	sort dtrace.out.expected | diff - dtrace.out.post
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
> -- 
> 2.43.5
> 
