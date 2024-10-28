Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A71C2420
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141061; cv=fail; b=kntIZOwACZKqHyWvgPA3YAIMoeEDW79YIXkBc6t0HhQ3+81xmoY89GINIZuXjzIAONuQ+m69eZH5Kf5RvNjAedb5j5hIJ/6TZUZ1JnojXjoteXN0UGx6vv7bN6t4dUNZ1PaMflvIXjmRAtbCKD5liIrU/aBTWCDdgC15VsVDhlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141061; c=relaxed/simple;
	bh=I/jb3WdhWcxJm7AQcHipt1UzJuKCWCjEreTXStFqtZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rP70tVmvH7Lc55dVgfWgsFEBlFy0N92BcWCTwWKoNtAtct8EAEQrKUUZKERNVhLVeCwy6U6rMUHYK0XtQtdvoyfbODd8ntJOBY0b01qjIBTAaie3abswKfo6Nye2lPiseZEwMvOHWFSCbbEgSvOLfpveUoRDOVEEoxSwCDxr0gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=STPxQD1Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zqs+L9Kt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="STPxQD1Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zqs+L9Kt"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtcKL031323
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=r7Mjntixq5JOxIHL91
	Ui01pwZDKaA4rBGc2XgMa/lBA=; b=STPxQD1QbtcT2k6OgfXwrjtITbPQp4VROm
	c5H6ilw6rDHu9eXVDcCqi+XPxJ5wMSSkUwp1xQwTjHNGLToGIgSIkzagXJVZ3Ef2
	fnnxFofuyTSrwbCaCwY4xJsr6ZkIx0ZXONfI/Pz3eJBCoRUo9makb4IbJemD8/Kg
	dZdkwPy950NdV2bqGlO3UUuOY/SMoVFo6w2zzCza5gQEHli2hT9lG6Vt9M+5PMXb
	0D/1s3qgkeZPxwUSmr62BuFRXMc34J/YPhckHrXmRhIXHyncaTWY6PSLtjj5Vjno
	tWe1PrxaBEIjJiGri1xvioxRVmg7QOn0YGeMfTWkAZ54MjDDyBog==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxkpbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:44:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SICHbE035074
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:44:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd6c4gw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:44:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwpgvuk9GA/olsC8qkcMWuOkdl1Ox4GbvHg9cHxW/vGuGwSCKnl7myAoWjaCOKCqj4KVx9TLMgWXVjCVy0bm1LVwRGAdwttyYi8rRrtKd5saCaik/Z+9dQGBfntUOK5GzfESSpWEgZh5HCd+/nJuUaXHPjOxtofDUeQRK02PG+ZZP3WfwNgZf3EaSsq7hWnoE5wiweIL3MlsukX20FZqgTgkz8R04cYLwzAghBCS3IWssvjSUjtAJNqd4bRJs2CEzUL3nqXOoMrWLXXK7FSdHG89EF/peI3VS/JRRcy/wVcE9AoYSFA4Iqk66OzY3U1nc/0dUFK7QA5BVu7r0YIpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7Mjntixq5JOxIHL91Ui01pwZDKaA4rBGc2XgMa/lBA=;
 b=XcrzfT0O2cT7UdIcy0mK+eXrcwyOdUWtjCGF+SxwrYIrWu4pkarFuMQcpje9AjIsP40rVdom09fHi58BXmsFiv07VNsNa1lDHmAQWoQHfjkYJ15huRT2rg/Z8fMmsmrC6JVaqhH1d6P6g3XidZN6BAmcJ+19to++s9pvtMBWVxTqu7losWcU8OgJgWywmJkczDkHJ7Y45+Ysey/5dnPvOaagd/m22WEqA/MfKxaxFaS3wpmm0ks1SfcEBLVW45w0vHUVbwS0osl+4XtCABLRMZ5X5bdZUnKfN2x7Loz9xpLZ6d40BfKgF//6OjuROqHtykNUz2yCqrMu6xYMUn+A6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7Mjntixq5JOxIHL91Ui01pwZDKaA4rBGc2XgMa/lBA=;
 b=zqs+L9KtofU16AdC39XTMlp0oOLVpCT0VbXaJsIx+/GnwhSn2RJhjeH/MwZsBtES9P2GsoFmOdmrV8Q3weuykwR1Cv+4eW4/Vj2hqH1O8H8Eqd+JiBp4DEBXGEtqR5cgVFLhsPwwLNbiZ+7ocaeM8OH2+mqhAWUJtysggZYznQo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5661.namprd10.prod.outlook.com (2603:10b6:a03:3da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 18:44:14 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 18:44:14 +0000
Date: Mon, 28 Oct 2024 14:44:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] test: Clean up tst.specopen.d
Message-ID: <Zx/be7yGfFeqoLEl@oracle.com>
References: <20241028183334.22140-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028183334.22140-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee923d5-5cb5-4107-18c3-08dcf78084fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QU+HSpoeQJqAcbqi9Cg2ifUGASa7EPIihvN1buUt9IIgJLI9SiNyWKTBx9sR?=
 =?us-ascii?Q?DhElZPJTg7h7jFrNH+5TCg6FYeMfj6nTU5kSBe4477tBWUa3seoGPnaL7/9j?=
 =?us-ascii?Q?FOTwZg+/VYPieztCe1ojPC1RkpH0XpB0Y1PxEG8jP/jWqVUjWMhkCiW45MuS?=
 =?us-ascii?Q?38358HA+YdfTWlw4dMBh7n8zxdrOJa7RQVisiH9zis1G+KKgQqL3mleW60G6?=
 =?us-ascii?Q?9QLD+v0VxPsfzZMZpEGjNYfFucUFVTUFyBrTeXEKTAvzCzNKsqYlUGVLyfeO?=
 =?us-ascii?Q?TPcogOiJRSuOhzq09y9Ey7Zi79Zd05xHj2vLqWKsOfdmeA1jjo83AmPuzVA7?=
 =?us-ascii?Q?gDCGDkhjBCCVJ496Vgjky3kQGTOZKuPxBld+7HUeIsJHKGgyhQsF1Ha/+otj?=
 =?us-ascii?Q?CR7U9f+gEdMziTAbkgac3Cv28rfHZ1FvhGT7kTG3Q0XF92Wt1A52zquzzXtM?=
 =?us-ascii?Q?WdkpMzvbC38/8FE3NzMihpQsjSEl2f0aqDea8uGXntaHkX8dECmw5ms2B5Tw?=
 =?us-ascii?Q?+X28UDsVuw6YQLoKRtJOwcQRY/qGZ3A5R48OTE/TNpnA+UmR60wKmqLGFLL0?=
 =?us-ascii?Q?kCEhFtz0QKrK3NG1Kcqw2lhXlehWfONGPEW30nWHakkVr0B+bcqdJRBDTu4O?=
 =?us-ascii?Q?cBmtZj26buVvhmV0BWxLDYAE0S/Vzm8QHJiPj6ACKLIkr8psMR4In6IH61Nz?=
 =?us-ascii?Q?+iCZtJryBRk/KhJMPmxoN0ndnNuBaEdRZFVaA5qzUjJX6jC2EFbHiEmMNXMn?=
 =?us-ascii?Q?+pact86CzG1IrPuvZR8EjGO+1AIxlg3VeBbQE8Cw6DjU9ECgVDF2NSixWzQo?=
 =?us-ascii?Q?fD9P8fkBbVEfCczBlCTsl8iFH5o0vFecqiz1Y38exxsBTQ4vVcm/ao58rVVe?=
 =?us-ascii?Q?zYYSJZmsN/XwTo4nvzB5Rq6cD03LOE24wQtXNpJFP24Ee9ZJeMJC5CzLT7/i?=
 =?us-ascii?Q?Oa3/b23vtvSYwgP0xrcpwBqvR2exjvUr1rGcV5lTtD+hJQS83YwbrmoXPkjh?=
 =?us-ascii?Q?8qaBHOIpHXYQRY/js78qJYcXE39glHp+edERSlJNkmgPszZbktLzFD2/0R8M?=
 =?us-ascii?Q?H6TW8vsx6Q2PWPnEHbwskQrrpiDFQGTXty8MEzHsQRFb3s/WAWA3IdTR+m3y?=
 =?us-ascii?Q?m6wfItHoLsyoPKaklZk19t2l/rHqvC6jNOWafamwOMym6phbRR4NWE9b1A1K?=
 =?us-ascii?Q?3LvSXR1mq0VgbKcEtpTRp+oxJ6qknTZpl/cLDX3/mpU1Cxw3Acza3D6eXWDn?=
 =?us-ascii?Q?bXl2br1xq4aYQef4kZWDOZaNmLme4IhuXamp2UB+VvNe8/XJk2LM1G7FT1ml?=
 =?us-ascii?Q?daEMiAWkgu7rGjCFRFccE4aG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CEAc3SBE1BX9b/CbmZem6+u3yvlTVxasHW4Fau7TGpgTZWzamG4ekbi4RXF3?=
 =?us-ascii?Q?E15QpcuaVIIEFDxcsuK4NxfBb9tei8FLwr+B4d2Ke+uyWI2FZvjxWA+dUZ/7?=
 =?us-ascii?Q?KQVbFWmQtZUhnyV3OdEthifXGxxxqzYu4E9c0oggG7sJZZwvaK0C8h7qO9Sr?=
 =?us-ascii?Q?sE6qS2vODDDYKPxYJ021h97JwMJ7atHTbICXQuk8nXL7kJPgh+ArXECs5HRm?=
 =?us-ascii?Q?cAqcc2YQK2N31QIcs833JwNyE9vMuLHi7vIAGyXmLzJWOnEpJ8unejMvG8GI?=
 =?us-ascii?Q?HgQrebA/FrBBqsor/LsorAKmb9LOpH1Ym/WeYQCbtCiCtAHWMa+a5Afq6uX5?=
 =?us-ascii?Q?pLNhBBRB8VLlA4g9IF8quY4oTnP94xxls46LILxdsVVF69OWQ5y80tgDe/AG?=
 =?us-ascii?Q?twUrPJ6kaFXDG6usP73/2pzCc02xlVZPCGgshBNdXjUeE+LnzpE6SXlXpxxj?=
 =?us-ascii?Q?wz6dDxEA6PGDIk3lullOUsXh+lrgr5TbjknBkPBKZbXl9DPduPzNGRIy/YA8?=
 =?us-ascii?Q?X5tLDMaSTuwIRvWui3HODBcRUy+RWjnSqPjKM+MrzwRj4mBv1LL36z+FTbp1?=
 =?us-ascii?Q?hq1qYKs3qtqmr+9MxBc90tNWS+mk55goRMH52c0uiF3f35quF3h6P7gM9pm2?=
 =?us-ascii?Q?LhFOkKp/KBU78F9g3USCeI3l5Ph9krEckUyENaD5A+GYPOv3BwmsBHSsc4K4?=
 =?us-ascii?Q?gbP4cJy+b3kmZLWTs7iSiRmTTUG7D/CeBe1gEwhAyzkwi0xqTNYukkLpzefm?=
 =?us-ascii?Q?TfMBnoE+FF2/hrLElPMJ0qJl4Jy3eygkIKRLgrfHXzPqblULL35McU5VutGl?=
 =?us-ascii?Q?pRFPBeDFSGtDCL7ZgyErB//4FSRckzGpNB/LLfMxxMGkz9rJypvJPta2Wkl7?=
 =?us-ascii?Q?N+z2tk/Y2BowQ32jVjcnKqZt3ATrczBf6dJ3xPhnDs6/g7gbeLmYjnuW59b7?=
 =?us-ascii?Q?Zqg9fTVGExPk6/wVg+SrAHHmsfF21jhPnCcyZr2MwRCMEhtS1UENiJDsT/Es?=
 =?us-ascii?Q?eC9oh4jB56756w6X99kkMI2jyaM3lPP+WYDznXdu6pzO9pE2SUochTyA8Rwv?=
 =?us-ascii?Q?EIJC6wlQ5XtjQ5PghvlgEN49Cl9U+de09lfUR1nwWkCCQVMjET2dFGpvG8tB?=
 =?us-ascii?Q?hpQoXSna2tXItWdUIj6Of/PdlRukYjvVkCB9oz7RGEkweF+ssOqIjj31UTmx?=
 =?us-ascii?Q?ppw1SdRas1CFrgUYdHKON4loAZ/hZZLt3FepbpIux+sJeB7Aq5PcTGr4fn+X?=
 =?us-ascii?Q?SwyEsaxUeow/7XpDN+eKs8XoF8w3Ab+z5rf3mlDrU4XQ6Sa/oj2l1ZAn+wXS?=
 =?us-ascii?Q?EbAlMcFBWUnGFy5qfylZ8IqRhQrSfSc7gXqcIoNpvQl1AqnkqFEnyaOHsP0O?=
 =?us-ascii?Q?mP+VhtoBulsBgxbZux0OFMSkTIZjcwlEygJFBkcSN17JXt9Hro9DqkG2ktCL?=
 =?us-ascii?Q?YoOrPGExxqPh98ID38SV2Y9iUFr9ertSQtNqAR5Tm63pDowfwliV3lY5RbKl?=
 =?us-ascii?Q?UmVqU6k1TmAgBOteVJyflJxQfYvB4kgdKzm1rGYDI+td/RI22+U8/bbAgx7D?=
 =?us-ascii?Q?Qc/E3awvwmCZGIKB4Q3qWLdmC2Q0+ZPUkIrKtjcKVEfjm6SU66yMzarNFSmy?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	thK6zUg7kgDFKme7DjtMi5Wa5B4BGYEQPxPxCU3VUdVCw9FLKNo8fWkfNRtD1MfeX/nC0cCfjIXBhhUv3ggKHYBiAozv9WgrS+xDattAbH11LjmW80THKzol1PN4dhnd2t7868tlfYOGJBJ98MheJcNiWiYKPVfXMRH6YXn14AuypDaKQzTi/2JopZrinrbyFspJMBewm66e4BY4gA5qwHKSWPfjXGKL/NyfF3QI9WpM425vB48BiXz0RxnV8f/ooyu5phw96O+/nNmTTsaxItlYKBnc2qg9HkodFt+PiB9KZ18aMrwtg/J7WRCrKRvj22nWFXuhcF1RDz97E6wKiCxx+4LMDbdWN+QCga7PJGaz+k6MlQrptL9/hTUqtp5shiu+WHT+a0Q7DFDs+RXOjcFDf09uoyuAUIlK1w5l95g6fFNoQ6t4mpYcaHzYdP6QwQhp+rnJhEhP8KWPjA1/wAyrNuaWJIIKoHIY8t197+8Gu54ueo3bV1nCxwWC7yXukBq07KPYuUfVoXShtssQ1WmcoOTQtExfvwiUbOaz1LjzcZ1DZnunLAPbyEdE9JrAHfMLGO4n9i0Q7eopPyZ9pnxDVd7nLl6Fo3qb0CxOfdQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee923d5-5cb5-4107-18c3-08dcf78084fa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 18:44:14.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3adXvunUrYMbLvLf7jnE6pVyTt0ZrBoT1GIng1RwptqZR+hKGd2XMExnqNIZNo5VfG1TkCcjzi23t7aWcM447s0S/uMvoAepPwfo0IcAn4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_08,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280146
X-Proofpoint-GUID: bpu1ijOYm3QaOTmxm32yckgKzmf4PqkM
X-Proofpoint-ORIG-GUID: bpu1ijOYm3QaOTmxm32yckgKzmf4PqkM

On Mon, Oct 28, 2024 at 02:33:33PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The test does not do much.  Mostly, it is a speculation demo.
> It just needed some syntactical cleanup to pass.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/demo/spec/specopen.d | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> index c510045b8..700bdd9ff 100644
> --- a/test/demo/spec/specopen.d
> +++ b/test/demo/spec/specopen.d
> @@ -7,10 +7,7 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@runtest-opts: $_pid */
> -/* @@xfail: fbt provider not yet implemented; needs a trigger with failing open()s */
> -
> -syscall::open:entry,
> +syscall::open:entry
>  {
>  	/*
>  	 * The call to speculation() creates a new speculation.  If this fails,
> @@ -38,7 +35,7 @@ fbt:::
>  	speculate(self->spec);
>  }
>  
> -syscall::open:return,
> +syscall::open:return
>  /self->spec/
>  {
>  	/*
> @@ -51,7 +48,7 @@ syscall::open:return,
>  	trace(errno);
>  }
>  
> -syscall::open:return,
> +syscall::open:return
>  /self->spec && errno != 0/
>  {
>  	/*
> @@ -61,7 +58,7 @@ syscall::open:return,
>  	self->spec = 0;
>  }
>  
> -syscall::open:return,
> +syscall::open:return
>  /self->spec && errno == 0/
>  {
>  	/*
> -- 
> 2.43.5
> 
