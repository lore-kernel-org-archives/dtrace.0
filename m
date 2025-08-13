Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFFA279DC5
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100656; cv=fail; b=AquaI7Eb3I1UkZ/EG3ieuJ9zhySap3QKMcf/KTGm0JEmeLrVHaVUBTof3IgJQgpqOpYEYhkHxr6T6IK5o2n7RWrPsUUbJeBwe+asa/U6wSS8D8pNiF9INbxtgZYtsy7/o6YPtT04ZgBxTIZvbTpAzntWfW/jxgZ2WLvqPW2em/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100656; c=relaxed/simple;
	bh=bVBWtQSo7RHbQxkVkTCXSVjr0NQYmusSYD03WKGRgXI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=f8vTERFPljePT+dPqA7Gm79QBZIe2eqAGQFXbFq/TCUaRV6QFVxXtvhNnuxLxJbB7sD/sfRViAHjgMwy/DozumruWeVD6zzQst52/GugyXjNCjomMswGVCTLo+TFcbT5g+tQBvgHEQ/dL9RH9kUqDrjTZmhdI/X2TuuRCoCKxx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OCBcsYbI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tflVBCYB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OCBcsYbI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tflVBCYB"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DDNbar028120
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=uEu28HFuWFg5xSClkOhoUrI+i9EeWIZ2CMDj2Ul5GDo=; b=
	OCBcsYbIEvlvwAX+19AkXt4DDNbv1GOueQ3qY6lbjQdKdohfGGNOl8ej4Zj5rNiC
	YWBWKsBKxRpQ3tsmlo5jVCK2eOotjnh+DFIvJMonupfzqhEhmz5C7Nat+9HTLVuQ
	gRLpq06UwWpDAE+MYpHOhvHYv1KNaLE/aSnpz4R6/DCNYZuLHb/40haaGFF4/N74
	+8po2Ta5mjsi3mHw4+bEwkqAQqdNpG1QTht1/Aus9WmXqbH329kZ/WaqT2g+gyei
	OnBeCd3RuMCqx9rRKgzYZbHKURb4T9AcVsPJAjD4BIv2rzU/juWo/5HilrXJoQnX
	1IKSDDOj0OsrZwQ5D64XTQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcf805x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DFiipK030057
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:32 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbkcw0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVK9JBLyLhC3UaHlgQK5f/A8TvhoVTaGtpfv5MfTwIzFVfFqCB8HktuSTtFbrGSeEtNbbnrpc7f1gDJywuLDvkwjrq9pjPJ+XBi54pH07aBDIHH43jZnwnFHlDqLF1lWOTwA7PU1sYvAXyCUYmuwpFZz/yjwJjDw7vqTYXbTfiRF1rY6v0keXrdIaIhlbPsOemt2FqqAT96WTmqgzWVgS6zJFV7AJiXNYacTxbf958AvX64fc+Y/9kxQkAXOYl1Bay2cu/iww2J+FZaOys/6lgG27PoA7Um4UZ0cPoGKQchjQ47rQe5I7BAuKtYrbl+zOtVJgZHduEf7OBODgvDRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEu28HFuWFg5xSClkOhoUrI+i9EeWIZ2CMDj2Ul5GDo=;
 b=CltYD9AlOvjtiINwAUJ0L2dFbNDCGIWwlKzLlVeD0ofKaENsKAPx3AHhdIisdvGpcCA4qy5HD710Mmg7b645pNJP2eWpf/9PlhUDF+nbBssy7xvDOevG5h9grEzv1x7W78CDcgxVWK+qudCTlxyTrloQJwkR3uTm03LpWeb8PT1eS2Hg8b732kLDxAHuECqg4WBb3HCwNRCFw9JG9U61521PrqobOYk+LI2cBsBmkAZ94wvVRXt4J+VWlo7LDfHDjPY7d2Pux7TFxxQtXftyqbznmsmVNr/iQ4JJ+J/oOddIfVpznXgZfjAaxZ3mhFOIGUc+gMR7oRj94xa78iWPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEu28HFuWFg5xSClkOhoUrI+i9EeWIZ2CMDj2Ul5GDo=;
 b=tflVBCYB3YzBdO8drFimXnP92HxDa9a918KwoN6bFVSgz/btjaKA0y31zvDkxxZKRA8MX3BRKWFf9bB58veCcOKYWB2wQnZMBRXGnDbmV/6720tkTN6kG58caYhHv9uiK8/SBTkgVxysDNb9AuJEreYg1mw2dIXFQs+1Ofw7/G0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6222.namprd10.prod.outlook.com (2603:10b6:8:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 15:57:28 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 15:57:27 +0000
Date: Wed, 13 Aug 2025 11:57:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/5] test: fix typos and clarify assertions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56728487563A93E6A5A88686C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef5a247-52e2-4ae3-1709-08ddda821a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C5RDd4x5A3bDvGBhzfFzMc1sJ60gbqX7nUMKDG7Ze1kFzI/0AHL4DHbL0GhW?=
 =?us-ascii?Q?8be6fSgd1H6UUBUT089RMZbws5SX4JQ3eTJzPxaUXSuO62K96y4O6YqrJBd6?=
 =?us-ascii?Q?Xlgv/S1ATLXiV10ncI/RAayTtIPEMHCEZvZxOlYweFKGApd/uEjU4PmLh4ot?=
 =?us-ascii?Q?fBMta1ozgunmU4OD9Ab4rb72GFXfrDWs79Go99RG/0QgtnOOfMwvVZo9Lycw?=
 =?us-ascii?Q?ZVT8r/szKIkLes6aPEq0Eq34fkWmORwCDImIuZUOvOABJZOoLl+rfUNJaGJW?=
 =?us-ascii?Q?YosbaPCrgCfQAOmngIUbpueM3QrKSHKqtx+2SE4zx4nsV91iSbqEIa+QkvBH?=
 =?us-ascii?Q?2aM/BY/gj93pN5lEvG8139Gmh3rbVxj+sdr+VZqyEZQobcGaWAmsfEuXpwjK?=
 =?us-ascii?Q?JW3mnj9WCTu5pcJ3m7k68QWc7Qh8DYMx3jdcVhg2bOmP8LLOg2zxV8bIoHoU?=
 =?us-ascii?Q?H5BCuevO5GJJe+winY01iRW7r1maHDugYi0l8PU8uxTWHiyYJFUizvwu3I29?=
 =?us-ascii?Q?UM1YYGx57faFhcB99UEjACnntKDeNVrUuoWEB4b6NXxZEYCX2sZFC0ISUyp5?=
 =?us-ascii?Q?KK9ErQaT7tlK1g2P0jjGhMTlT0odUQdMC7utxKOiduseNoE5Cb9QcYmrZVtz?=
 =?us-ascii?Q?k658n51Q8B3ZNgIhcLPpK6Ar2vgQvS5ofYzcM7T4sViV7ySdRCXKbjhmPdi6?=
 =?us-ascii?Q?3CQKZUbGGU9gul6XuAvdfA3EZq6VB0wBWN0DGY+C2kaEzRIdGyrr0pp5i6Me?=
 =?us-ascii?Q?YQTZacDaPGIClXYeO3obK9CKfrpeRgRrQ3iqDC/wOfYo9ZOcPx2Juz+IOzOI?=
 =?us-ascii?Q?f/eG4cxopzQHYP1OluXDYIohIwQ+a6ka9s5ltfBtOOsow2U0WtTQpd0D/0ty?=
 =?us-ascii?Q?8jEa4uIbh0Bx/cuTS9MjrepgwLGuHomw980/IBtYSVKuUorwOS5/3lVh9SDu?=
 =?us-ascii?Q?ArOZuyrHdpYd1sGjchatpxtkgYQ9Cq1F/jsA7SP9xGTWQBRUgialqdKfSIxY?=
 =?us-ascii?Q?vEuDeeiya8JJF/lnnMrt/pRKonKIJZVZjcE5YSjDPf3DOTny8sDF5THihOUY?=
 =?us-ascii?Q?Uee9Vp9YS+kVOWl87+ixl6vB+/wILJAysLLB/TV02GOj7dbTOBaeWDcb0h+5?=
 =?us-ascii?Q?Z9vKq+psZSssJqoDqM0Um1zm6X1K5wzKjjfBuSq9UaRI4z4ADpoJ4qhQpr4M?=
 =?us-ascii?Q?w2T+pE8UOVbqy9Ij3kLx3BuxDWqd05fzHpFANKW+xuCwBs4W6jmTI9fAQMHq?=
 =?us-ascii?Q?Rjg/BFFrdqNSVSRWbckn84jANIkwNDcRs8sgNneOa5GVugWMLVl6+0//uB14?=
 =?us-ascii?Q?8xRGVHUYeeJJnUpUxxA73xh8Iv8FknGYFYOzF17wH/Jq+yPQfPsawgnMLZAz?=
 =?us-ascii?Q?PDWteKrlxuiMU1BpBNyPZmW47yoNCMTrYhmVaLso2XcRrbmprlOa7PTmt3v7?=
 =?us-ascii?Q?qFD/6nlHibk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2nTEBgiIlRMR8eLHQ0dUlWvsbCxT2/ydBsFb8WqCHD6RIha3dWQPKAzrhkz?=
 =?us-ascii?Q?VvE5/rDmtXdl3pv24H+enbb4rAcratySgxZ4JIx2sVjBCStht6HVZb4+HzGz?=
 =?us-ascii?Q?EkTnJRMy3Dnu1ApUvxrGjHddGzquOBjKnRPk8F8luH3Og45Zyhu4GBROEuhC?=
 =?us-ascii?Q?MqPgJTBEF/R4/Ng6ULeYd+mQ+9V+uuPyqcKQSDFW6obBJy667eQek+ZRe66T?=
 =?us-ascii?Q?2tJdJu4sQmp/srg7ru6bEdh8sHvpjwRoL32wClfQ3W7tqjXnEiyvDWF6Pkrr?=
 =?us-ascii?Q?//OY/VMxK6DeXDgqy2Tfaxj8ApQux7xwwAQRlL2hTzp/yVpoIFEaB69bXXY+?=
 =?us-ascii?Q?R/mJkhP0q2yLnfufJx7qKTHkMe+Vwt2iLmnR50slw7633yubJOSgSx58t8Ko?=
 =?us-ascii?Q?61bWNEmH/FTg45CViQC0/z5N9ear/LWxnN/CWHS2brrPAg/aJFvmsLyoCyxL?=
 =?us-ascii?Q?ckFMqP5FfJYqpxomI4qwGyQepI605Kjw5nke0gyyQvY1ZVsFIVJlzQxIP2r0?=
 =?us-ascii?Q?HgxacMqEo7o+PuD80NOZvkFc4pLIc81yKhQVO9MSX3Tvc1jFeaojf4cCCXcU?=
 =?us-ascii?Q?5WoiAUiuqfIw0L+dAFIUJhQu5qtf2SvIDAnydsPCrZ7nnEEfP4F3y1YAgK27?=
 =?us-ascii?Q?ocQzLTKbDoQf5eCIY+AFVvBvYjHiD1wvL7uPetepC8miEMakKEU2s670hOAp?=
 =?us-ascii?Q?NUZaji0yDaeCd24oSEhxnrVG8j7sWRzfsHS9dy5DHR6ibac/wSbqLutEsRVV?=
 =?us-ascii?Q?Toa6fjlpFjWNr4I75c4uDQBrF1RXuUwsYU5cbtkkynKbASo8gi5B+vQ6rSlx?=
 =?us-ascii?Q?nzMVTwCWiuwc+Jzpuem/+x7rvtQSNpDQnGzS4lbk239K+kHsoJ9ZFlN28QTn?=
 =?us-ascii?Q?aMu8pfjFelC3fvlH1hUnYtkB6CGm9oj02wnm3cM3JIg8UK6PsLb263R4eIv/?=
 =?us-ascii?Q?K+UrjfFqPLBu5ISMWVXn0YJq1Bj1SRi3z5EEv0Mm1EHCAjtxvmnogbSLbns1?=
 =?us-ascii?Q?5xiiYJ1oL3dPoYexdPfrrlj0Bt338RT2tR4G6Sig9FW1EhJpXCF7ITzgkQOQ?=
 =?us-ascii?Q?PNz3s5dmzEnKuoRf2YOsYZBchyQWKcsFUfMJ+58gTrIWM1HgA96g0bTSRlNL?=
 =?us-ascii?Q?q9RERQGMfOOA+sg7pHb4ahsgCmMJ9026ELiYRfIU5ZD9ocXZq+tMfhOnrssm?=
 =?us-ascii?Q?A16q03i0YZcct/42h91SN5SC3ghXSyuJ09LBw4Y9iedelpIMenDumPONJOxl?=
 =?us-ascii?Q?4nBCeKgFxIkF22zRvtzdTYlbGbu27bgr5eeGdd027AtejKLnktAyv4qSLfg0?=
 =?us-ascii?Q?gb1OK+W7ZiomSDJY04q6uRRwRr0Hy1SqJ184dfgM1qry1OxWf2ptsUDCxDUO?=
 =?us-ascii?Q?wKsyoFC+mTtPQMlANgC5G5V3wcF6074jNwNYhgKhiIDiate4qozrz+NBKByW?=
 =?us-ascii?Q?sri+q8A7cSJfXRTCdyz2F3PalfuAEAnMsizforX+isQVEJ2j2uh2TDGG/Cws?=
 =?us-ascii?Q?hKGDeu0jgpLp6dZUq3VM1HFglKbcx9i9IqhMmDdScUzX1lTAAnHiM6izNHF6?=
 =?us-ascii?Q?y43VDWSUoh57tRIjdiYV2kGxP8eKEW6tVNiBoGhnFToWmiAytBHVI0vhb4jy?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dh5Ae5Viy6/0O7lI5K+VuJ0wjY54mhFLCs1zi4b7fzmdRuPTXsPWSymO+PXNLOwgKtYChEmd7wie0J6SPPZO5H5axdVqJLB2+7GEueKRNbj/manrPMJKLpPzVxPfrztXSDf38obmkxpi8NfMiX27gYcsiMntaZ8XVtg5QngSwPKrZm/fj+F2sXmNaIaycPiJpD3x52Y/3NP9PpK9S0uLH9C1ZagRxMFPKpMUkw+HsetxBqKlvo1F7S9ZVV+SJZWtJqIqUDVpwSYXlXJH94EYqNYAZ3/hLU4zzKHSEX3bPiF1u3PTOeXULn5kFgk89Ao9zS/zpHAObHsCkSBgnKkB4Cv3r5YDQz6UHc9+y9+DhJTzH52QzABKwaesf3xT7On3Wc4J9/Y1RPICm/f1j1KhR5ijbwl0a0W/ZEJEo042+83KTwjXc5edJUFpvORSccsBQ3Agco2DHdSA6vrbN9uCzqMcgAa8+EObK6iC321spXdLaO1p86jOYlpR2JGCrCVd7DVeJgljxUuY8D2RhFFtcvcO4CgNLqXdivd2w5IiLoejPA3Uh8RHzUFka52drAAqFum71LSxAHYK2Q49yXEGM0poetWi9Yz5IEi0fS6PlP4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef5a247-52e2-4ae3-1709-08ddda821a0d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:57:27.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImzMnXaCk4Pbnc+LI37+R5Ykz7xkw2SmDbr/Ms6g4BQ9MYpd8WB8H78XOi+e7ADiWMXrBcIgm97fCgPd40JQC20x+lEfMq7LfIF94rLfX/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130149
X-Proofpoint-GUID: l_LXwuuON4afM3o14WCURaua2JR7NSR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE0OSBTYWx0ZWRfX4W6ieW/tqc89
 OwLl1tIkBSi7ZiExdO/FjcdEawbX8StqJrEtQmLhblUuMuFKjXfT6lIXDH1svvzdX2sPp1Yjla+
 5Ujk4tlqQ32uRsgNt72OpbfxO0wPNS+5C/8NEXpTV0pHSt9U76jU2XOjdG+G1rsExgbCIf7vuPT
 10oLvwoRxkQ4r4l4NhM1B6qThmz6EDh0gK6PvfzDEtUc9xH9mZL07Jx8oDiiPnbJPFFY9hW8Hbt
 kXzMdkenKu2i1IuVqurRwI7lnA4FqVlMP7v2/f3xCRv61Du6oAUExRKLX+X5bELmgzc0SiOrfBr
 /ILX50R+8HvD6eT+RDa6mpzt4VdLmGv0wsqwEY5mgCk5b3unCT1Ugu9f8rml20Iq+695QUcyKIy
 cBq5CWRm4RAvikpS4EK4EwZZ7DX21I+6p8Uoq3A7zLYrDwd2bOQ8syK1eTxHkvrb/BQUK0gI
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689cb5ed cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=AYlKiThaALVeCXmVZxUA:9
X-Proofpoint-ORIG-GUID: l_LXwuuON4afM3o14WCURaua2JR7NSR3

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/actions/trace/tst.array-char-multi-nul.d     | 2 +-
 test/unittest/actions/trace/tst.array-char-str-multi-nul.d | 2 +-
 test/unittest/actions/trace/tst.array-char-str-no-nul.d    | 4 ++--
 test/unittest/actions/trace/tst.array-char-str.d           | 2 +-
 test/unittest/actions/trace/tst.array-char-unprintable.d   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.d b/test/unittest/actions/trace/tst.array-char-multi-nul.d
index ae6370a4a..bd91498f3 100644
--- a/test/unittest/actions/trace/tst.array-char-multi-nul.d
+++ b/test/unittest/actions/trace/tst.array-char-multi-nul.d
@@ -7,7 +7,7 @@
 
 /*
  * ASSERTION: The trace() action prints a char-array of printable characters
- *	      with multiple 0-bytes in its content.
+ *	      with multiple 0-bytes in its content as raw bytes.
  *
  * SECTION: Actions and Subroutines/trace()
  */
diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
index 4734e619b..ba0435db8 100644
--- a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
+++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
@@ -7,7 +7,7 @@
 
 /*
  * ASSERTION: The trace() action prints a char-array of printable characters
- *	      followed y by multiple 0-bytes correctly.
+ *	      followed by multiple 0-bytes correctly as a string.
  *
  * SECTION: Actions and Subroutines/trace()
  */
diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.d b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
index c9acc4e73..48633a6cb 100644
--- a/test/unittest/actions/trace/tst.array-char-str-no-nul.d
+++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
@@ -6,8 +6,8 @@
  */
 
 /*
- * ASSERTION: The trace() action prints a char-aarray of printable characters
- *	      (not terminated) correctly.
+ * ASSERTION: The trace() action prints a char-array of printable characters
+ *	      (not terminated) correctly as a string.
  *
  * SECTION: Actions and Subroutines/trace()
  */
diff --git a/test/unittest/actions/trace/tst.array-char-str.d b/test/unittest/actions/trace/tst.array-char-str.d
index 465721b04..b61de776c 100644
--- a/test/unittest/actions/trace/tst.array-char-str.d
+++ b/test/unittest/actions/trace/tst.array-char-str.d
@@ -7,7 +7,7 @@
 
 /*
  * ASSERTION: The trace() action prints a char-array of printable characters
- *	      (terminated) correctly.
+ *	      (terminated) correctly as a string.
  *
  * SECTION: Actions and Subroutines/trace()
  */
diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.d b/test/unittest/actions/trace/tst.array-char-unprintable.d
index 2fa5a1066..5b2525c35 100644
--- a/test/unittest/actions/trace/tst.array-char-unprintable.d
+++ b/test/unittest/actions/trace/tst.array-char-unprintable.d
@@ -7,7 +7,7 @@
 
 /*
  * ASSERTION: The trace() action prints a char-array with a non-printable
- *	      character correctly.
+ *	      character correctly as raw bytes.
  *
  * SECTION: Actions and Subroutines/trace()
  */
-- 
2.45.2

