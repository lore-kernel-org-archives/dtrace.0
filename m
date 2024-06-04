Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5E140375
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717535438; cv=fail; b=QWeVWzOtuGLfPu+GN3G42PFosXgT1SIIbx5kWkmF4gwPKfSgh5FBVIS0feLrHjQjt1JSIr+381L6B5Jy/I4ljlIj7d77TyqKLAkYLsKdslZzDeDM9Km6gn1obSGl+HjQ9i5XAhgYDKNRrMO2CXD63dyronEdKijmI+iuZH1naIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717535438; c=relaxed/simple;
	bh=N0xCUAIrrFcSqumhqlrtklg2n2zEgWpHD01xGDNROmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iW/Cu+vmDaAhtjWe7WNnBZsl6riRI+3UB9UWJskt+NmSjLmXrW+VxEemUjm1/xQNAuBpBDBC5acTSbaqLbYH9wj/a0YVTp+NNf/f8TmrLbEn6v7u8kdFxr1K0OxtifjsKNp1Qyyidgt5fIhwx/zzqu6ZJqPFpreeSq/su0Zj2P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454J5Uc8004590
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 21:10:35 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-type:date:from:in-reply-to:message-id:mime-versio?=
 =?UTF-8?Q?n:references:subject:to;_s=3Dcorp-2023-11-20;_bh=3D/EV84jhvqT7u?=
 =?UTF-8?Q?XoMkDdBP6tkz0BPH9Yh+sKVxEqb1Kmk=3D;_b=3DQ3Sd2M3O2HEZINym/B0TLt5?=
 =?UTF-8?Q?xHvbTI8wpf4PNF/ZjABo7q+7KFHEw2bH7Ue7e6SMfMDsc_PYFSPMWDFD1ej4h17?=
 =?UTF-8?Q?/fNA8DPV3o7p0cC2fvESTUzpIdqy2lunrphdMNKKwupjKCSi78j_B3WeWur8+jK?=
 =?UTF-8?Q?lm3bMBlA6WFFCbbUlC4LX2l9k6tl5s7A0fRx8P7qBSzBKrw9mMVP6krEU_MJyVA?=
 =?UTF-8?Q?bx0CuSGvjKR/w3r+5sjc/SoJFN8ahUg/4aCQWHY2yWY9LN2GrKg6F6Bu3JbRjkQ?=
 =?UTF-8?Q?_mW5zhm2bXkN+25D1cachslKu9WlsT9QRw0JpSMob33RqAzlxfMYKelYIacyfli?=
 =?UTF-8?Q?HcbZwW_0Q=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv05e05d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 21:10:34 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454JgjCf005491
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 21:10:33 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrme4h3w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 21:10:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nS7rGggDY7CJNGHL7QzyJhPnf5wXcdnAIdY5oSjI5Fhz8zQClEKwur/XrjC0fhY1Z/xBKH0x6NhleiDolzTUi9f8xuU7khvU0DZp15gOUoIEQDXRxBEBBFLGHGbpEXvW8bF+W+RCfWfqix/11gX3pe7F7YWAb4loXB3kqlY2gjp1oEOn56PHC/rln1KQX5te1XwhARGyi6Eg/k9aYbxAxee/LO73oRpc8OatBTt87BncYP+UuQyTp/W7ytQkyrauWQmi5wKf4b/Zzowhxej3nWHYC7QtVH6vQmPNl8KNkOTia40f4mtd5/5CTo8w7ByLLoVrrLrxOB1+i5jLqDk8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EV84jhvqT7uXoMkDdBP6tkz0BPH9Yh+sKVxEqb1Kmk=;
 b=dfrrSs9XGmTkWORSK/q6nMfy9Q91J4tgQbr0JSpkQdsLdxZEaPAgNwAZdWh7Wm+ok4GCLyUpM8FlcHWid1f6OxKLFn6a2xk1h26J1Ah0qhgJFMOLbHP8HS0S/1scsqoebwKjYj63X/ofKucpE2zZSRl/v5+MwQ6Gt3ISpkUEeRkofaKHXh6c5Vlwv8hW0rX29nVSbDTdhLIL5W0nHVnPbaY1EBsBDp2mLvWrGtL012irhvs/nLrg8HpQ0CjXfUc6MEjucH38SyzzQEbYwjIXxCwbbEHX+Qo3AOTkT9199sc5T0pd4aDZ8yuUVUlsEAYEkk1jwarQgOUU4ha9zLnojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EV84jhvqT7uXoMkDdBP6tkz0BPH9Yh+sKVxEqb1Kmk=;
 b=xz7qkn+6q3Oonx8nf58O8CVgY5eTsGVOlHgQmsUEk2JNUyR9cN5PbwjOm7CBwO2sFzSyC11EncdD0aJYbBwyqVHYWVZyfLtgcoizedu2FHtnAiM3pXY7YEGNStJRb5x0uVPvgbHDiW/wjycDvPvIKajnY/joMoiPWOzWKB5zwV4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 21:10:29 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 21:10:29 +0000
Date: Tue, 4 Jun 2024 17:10:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 04/14] Track uprobe provider descriptions
Message-ID: <Zl+CwFHv6bSJTNHw@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604181113.11505-5-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0315.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fddf27f-f3db-4502-7045-08dc84dac337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DsQNm4v7myEQqF1RJOx7CgiGxm3lKSzOpSLT6y74O1QfHokZx9wLN9QxjpUz?=
 =?us-ascii?Q?G+HlDUye3V4BWWUOr8yIC2G5JT6t1t97HXMJpDaToLAWHiXOo6jk3AddZrYC?=
 =?us-ascii?Q?cVmCUkt2skdc258jIDhyQCRxJDonKeq0R0d0PpK4AeNJc2g9VG2iMyqGc+0g?=
 =?us-ascii?Q?8rxzxpNONn284F3Ux1STxfrYMabT5V+qGWFOvT+3ERyCnlUIg9ESnplO3Nj2?=
 =?us-ascii?Q?C4NJbSnUWJrTh4UMnGhAQAhty6vGOCbTGjfCIFf8GOMdz5btBhYsdViMiLry?=
 =?us-ascii?Q?7VkrL21IqnRjLgD3ngUlFIhOjbk8rq2ogNd56IkLTwQHifbVdkSNemkysZ8M?=
 =?us-ascii?Q?orAjeubPfwtKhMDD7hWw7iXAm34EaQMclEZXOlvNZPXXQDEYW4SRSwp2zkG5?=
 =?us-ascii?Q?GDY9hhCPjfiNPAtEzqyGPPEhU9RTP9Hn8+fGCw7UiZAK1xon32xVSNYK8Mk4?=
 =?us-ascii?Q?xqkek/s8guWgOUvg31nzYmROnT9Dqn+cTvf4Aj3T/BdmFkYT3lS8uVeMc6sw?=
 =?us-ascii?Q?Xegvjix0f3xC1Z/ytxMBl6rFxFUUzbUwvzhHuV51h7mtZVpXuIKAvh+d/aTa?=
 =?us-ascii?Q?dBRM9dVXU1fJ1E1QxxLaC+C5/fbZ1MjvghWmQS/7b2veHv8K0Isz9BrCXk2f?=
 =?us-ascii?Q?pkDwMjkOnFxBNenWPl4s+ijk/Ozh751vfvpOBgCWaWmMP1aOTgoDKlrAttAR?=
 =?us-ascii?Q?TL1wLNO/94LtGEs5PEv/ucWv7Fo5+3xBgM36M/bWwg5dhB8ElO1tgJ9swyqQ?=
 =?us-ascii?Q?EG1rozltvtwacQfTIcLCCScVMV/VrY3FOzypbm9PHETI5mbx0xZHjJFUtv1S?=
 =?us-ascii?Q?gNt7ZLKRUYaI1zeouexqSmvdz43jC5c+VHBJ1AG+UGuyCCo2jSNrVic9zlhO?=
 =?us-ascii?Q?smxcls5LM2M2ZOWcTEIQWIuzBaxJjmtFmF3TqkliDMUwi+x27kphvsFpe8i3?=
 =?us-ascii?Q?csmBOTUX8z/3IWtbhbsv0Nz/Z2Nh7x0u4iM23EBcgINOKxm9SkOXzk4Y/b8D?=
 =?us-ascii?Q?KbjHOIl/FCuRwBH8U0haK15nGvpDzgSNriuh1QltEEMh/VET4CW/483cPu/H?=
 =?us-ascii?Q?rGgMidfPfS3osL9eGCXQ0iWit67GSnQHaSx5eePiE9Ty9jWktEBqT7n4hq9g?=
 =?us-ascii?Q?ayvoHSLKaSZMNJ9d9O+vwUQxyeZD7WLclvK17HgjSlUDuXUryOM2siMA2Iwa?=
 =?us-ascii?Q?rdpv+Jkizsi4qJUlYTSdV13xU4bhuaB7waa/40NefmrZUAmhXI6ho6a9wnbG?=
 =?us-ascii?Q?HOkjnE9AcJ5Lm19DPdj9e+OEwjcmU0JoyGp8NGjOjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zF+4wTbfnInzNnSQgqcU4aUWSsrNLYwbig97ezPtn+DszZdym97GKZlWVzCe?=
 =?us-ascii?Q?AofBfkhzjlHp8V563+yCVroOYizgEazBOLRqIK3lJySBLDWGgSbaQzb71CMu?=
 =?us-ascii?Q?mAJd0QjkrAZqg7lIh0PfD9JrsEx84OJ231qlGWaPPx+3Ky8Y4ZCuaGvv+J5F?=
 =?us-ascii?Q?9fidD39LCfdJA2PiXxbVzUVrnICflqGuB0ojFCZqmcpibEtIfBo5r9zXVN9P?=
 =?us-ascii?Q?yuoRJWw1ctGDqsK0oYNksbi5qZmUsTZr0U0rIQGP/7PwlGoLjiUnfKXHgkXA?=
 =?us-ascii?Q?yQehXCvhcZ7M/OZWvlBPOs+miGKSQGwk5NvXizaWTEb5ZlN6lpFgWQvUdNG0?=
 =?us-ascii?Q?eaMVD0oAcCP/SrJuq17k8BaKckUDKdTIlOb0Hkug4+GJQFbz+xxpU3rVHZ80?=
 =?us-ascii?Q?9x3FRFdg7utN/4ZXX4RS5OSvkeugbGi4b6H1Puf4VgOZzIRocoeEIsihEvO7?=
 =?us-ascii?Q?3XUNGPXYN+8TRhpiQ3+AFDV6y9IHlgY3TqJMZmK1ctI8uOt6eA43pKw0xGvB?=
 =?us-ascii?Q?jy93QSZC07pXMcRest047fu4YAXZM6SQCzIy5lX5IF726290WpUfY0DqpfuX?=
 =?us-ascii?Q?pL9Q0EfM1ZUEChpNgvyPsMGbiGR8rZ8/8wnMK34M7QqfpNfRwsZkItxalvdH?=
 =?us-ascii?Q?rV1+YmwWoEERzO53fhpMMW9+scdjXcmZtpIlmkCbMDAmazh8PzEJ9S9kALkj?=
 =?us-ascii?Q?O1SMlzsULVsnac5vRRG/n/SyZuYVrNvjp/KkU7a5N4Qwe3x+9c9yGB76D1FJ?=
 =?us-ascii?Q?CBb/7cm/Scac1A/KGyTzblzfHIJ2RVZ/QITynVDSno1AR+DdWO6kNwXB9I0d?=
 =?us-ascii?Q?/x7UlCfbKbTkXP+S4AYvnln5vNdlG/e1UnJ14f1HbGNrpEE0tAw4t43a6gv8?=
 =?us-ascii?Q?c/cjOTaKHOBKZ7Rnd82O6BFL4GUyM/u0xLstPGBPd2I9c+dB+Yhj233TYhPb?=
 =?us-ascii?Q?bk85EkaPKuHNCl2zbC3wMMwwOXcEcnUf3zRS2vy4UYLcRUwLbmg0lXHvP7Ln?=
 =?us-ascii?Q?DpOpxV2Iu2lNy9+ffuDyzAAIm8MUS9DVapHBSrO2/APxcraw7bOhX491wHul?=
 =?us-ascii?Q?mduwr5558Z5xvB6p7yVYdjij2dmbOrQweJtd7auiW+yudd8pRBNdIpEgtKN4?=
 =?us-ascii?Q?a+oAk29uC33j8POt9iCpQ07fQlF0EQBivq8948Jbzzn9qmbVINel+DFRjBOn?=
 =?us-ascii?Q?+KUCYHGzrC8U7G9SBaWN/KMdzZMOUEkb7SjdbPeIuPD6Nhi7WOb3Bkz27/zM?=
 =?us-ascii?Q?VZnBBaMKk9MPaV5q98w5+EYqKpsQSsSu6ejrT5FCtnPtRorLUwOnd4ARv9jf?=
 =?us-ascii?Q?/2QU3CdSx+yfGjyftg++tXYk6VRVI8dL1hrUjl53IgKAn6snvj1iHTrxVp9x?=
 =?us-ascii?Q?WI80VYoJbLAsIZLRxodZVpa7NLidg9DVmJ3ipoVPO/kFR+BhudUYNiMclFAN?=
 =?us-ascii?Q?WUHpTTGwQukOnAOdP1MqJirZE8yFY/C5HBSDMYOeSvMur8r7sw9QtEY/tx8z?=
 =?us-ascii?Q?J7WeIG9zrGpOZW/Zq9gEL/rIs8tO7qdBLaLMqFWEx1CMOFuwLkeLkQgJUhhR?=
 =?us-ascii?Q?7owJYnOXllSr6ai/5WYvBC6QqUqyFYjR5GI7/cUhnPkB3cDBpH2VJm9XRT1H?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MInOjlOmy8yiD2aN1/Cf3A/r7TwD0l60KSL2su7ayA29t3nqY6cOc2y9ntvNoZxHikejZey7XB6gldEzgwMmSAYFDIy3bsm9ozyJwoLQLMmEKbE/MfLxOu5/1k1jG+ykAQu8zMV29OcnyVw1368yoiySZSnp856ZO5zJqhbzSZEoLLT1d35PR3waln9YFZ9FaB7WY0sDZR8jpUqmWE/YHSqF51ShMqVLLEsqYYxqsIli7G0w0XdWSL9FEEcYSDbWlIrwvmgMSvqeqBIn1+JqT0rkCwjqGXwhjTPD9kjzhLgFiE86h2STkC2TmdZpr32eQ/hADq/9jzdweLZXGMmW7hz6lu8CNmsTMG7D6Bf6WpFBdmaoC5EtvMtRC0430e7CSK4X8ndcmRojdB+4kBi2/NyvpnA5s1o8qSulVAGyH8hmOhbQC3zSt/vKizpuUTDm0Rc6xWBoV6r+Z/z1JBbMtO/iC4rXVPPf21Z/Zv25FfW4+GzH2dII1+TnfHdLe97eCGk6ZnIh/QwtLrK+bVmiMnFFWF6hjd5SiURqVU78//CRsyqYRPlowpLiEmTf88PGditPEPzvXBLzMBzt83/6PJ7vDWUu+MiJBiNk202adzg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fddf27f-f3db-4502-7045-08dc84dac337
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 21:10:29.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa0mZbDwIhbEoX0SQGuxeH6jQS68ZzG94eZJ8ItUabpT4IaT8xdzR2UW//CyEQWaShvMUjOhxvz8B+aFmUcmTuhfGrO9xQIPplf7It4+Jyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040171
X-Proofpoint-GUID: sW2Frz1xIckKUqNa8pA0ffQi9_vFzpPL
X-Proofpoint-ORIG-GUID: sW2Frz1xIckKUqNa8pA0ffQi9_vFzpPL

On Tue, Jun 04, 2024 at 02:11:03PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> A uprobe will have to decide which of its clauses to run for a
> given pid.  For now, keep the provider description for each clause.
> There are many shortcomings to the way this is done in this patch,
> but it is quick and dirty and helps us bootstrap real support.
> Clean this up later, probably turning it into a growable array.

This is the wrong way to look at it, I think.  The underlying concept is that
DTrace supports specifying probes that do not match anything yet (-Z).  Those
are called retained enablings and they can exist for more than just uprobes.
So this needs to be more generic.

We also shouldn't do this non-discriminately for all clauses all the time.
Obviously, when -Z is not used, there is no point in doing this because there
cannot be a match-after-start.  Even when -Z is specified, you might be able
to determine whether the probe specification for a probe matches perfectly
or whether it needs to be retained for match-after-start.

So, let's put some thought into designing this in the more generic case, so
that we can avoid going down a rabbit hole that gets tough to recover from.

(And whatever we store the retained enablings in probably should be added to
 dtrace_hdl_t after dt_enablings.)

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_cc.c   | 1 +
>  libdtrace/dt_impl.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index d1ee3843..6bff7e0f 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -215,6 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
>  	 */
>  	dt_cg(yypcb, cnp);
>  	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
> +	dtp->dt_uprovdescs[dtp->dt_clause_nextid - 1] = strdup(pnp->dn_desc->prv);
>  
>  	assert(yypcb->pcb_stmt == sdp);
>  	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 01313ff3..1bf79d80 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -310,6 +310,7 @@ struct dtrace_hdl {
>  	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
>  	ulong_t dt_gen;		/* compiler generation number */
>  	uint_t dt_clause_nextid; /* next ID to use for programs */
> +	char *dt_uprovdescs[256]; /* uprobe provider descriptor per clause... FIXME turn this into a growable array */
>  	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>  	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>  	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
