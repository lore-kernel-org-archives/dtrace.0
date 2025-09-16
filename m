Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAF1B85F8
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 20:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758055567; cv=fail; b=GWWbvg7kQv1ES3g6oXUzPWx1pgIZ9S9YnYFJpPdeDt+9+nVTpPa8bT9j7lD5cw7eh29AbODWHV6biXiyFEU1Pkbd5uEGD8F0OnrEKaWNz02AQKCxrYyoulIznNkk+KJWwv6cSuex7TWeKY+/Fifc3rniYjLk3+B7b7nmUYxnkC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758055567; c=relaxed/simple;
	bh=X/pYg0WQseGKKzHT+YQO684spgPJ/6Xpr0LCDWTXGJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OS+KZvWXbS/wzXt5HqpF2zZyNPsi2r5/hgRJQRSLEygzX2VMQszItlHdF63FEUD/m0vkQCxJcJVjbgcueiGv2mVfb+Q3thcHqvtQO0BwFnVPUrnb64TqS+CnO5MPaApNZaBBUvSIv6vY/Zrlh158g6MLA9XgwDqn9SfBIB5zJNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J+54uojB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J4D3+y/F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J+54uojB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J4D3+y/F"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GIMs84007439
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 20:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=z5xBI2xqF4qVsQlQuB
	qnW/60ExJHYZBT93tVjmNzY+E=; b=J+54uojB7E4ildKuDjM9jA0HHRkLUrWFw0
	6T5b1w0JGAefQtHRIHh8cA/001K46Er3mPGiJqv6yeQKleGZ+e8B36Mv1wxfxIYg
	gKSRc7zde5t0+g7xmbibh69UUBjR+Co9GU3SAVx0qFuUCFA48S28Q0NhDd6rhHVj
	unJGmL3uhx9+OP5dpbi7/gOr6IQySFL7qrT5rRg3ZeIm0M01gOzzMqqBbIc1q4zq
	8knUU5lzQ8wIvkfalv8AVC33pT/vmkbHjO2B0PHQ4mKaiEpw7D8BnPK4xxt15CF4
	M/qQHTQ3lMCBWaS/W9/CSqdKbgCTPptY+kAL4fUprWbToH+edhuw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yhd5mde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 20:46:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GKhKwI027251
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 20:46:00 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2k6hyx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 20:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSEdCfmS7HqgS/fwrI2v58uWDC/HAgPrblOgo/hiEVyzPIjOBYlgwee8PFZ0mfkcghAQd2DBtbBbn08wyeqC/cuS0Xs5GPikygLhTmFgg73OnKRSfgnQ9egLHS4/QX0WS8a+grUHq4kahyJZ9RzLHaCPiJVaBXh3RrdtASq5lDheCIaTTSVk3XTVxQtcl2ZPNbRJo/8jP9GXaaRihQtfAUMvH6x7w5ko1YCTLhIkn6MBV/0nspNKO7qvBU6UctvkCpCf1r/SMrlGT+hD75H8TABFGqgeQdzDjJcZy9Qy+1cPqSEOyWgdArtH7l193hU40BOqJeyI9BIuixO1bZZ3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5xBI2xqF4qVsQlQuBqnW/60ExJHYZBT93tVjmNzY+E=;
 b=mXtGry0MFJON/ixZwRf89UsL0bpm0j5raMdBZKWEFuYC6Lm3lPbwClexa49DzicbTPJ6On9lw3uhyUeG8eaAWfDdorKIyDNoBhE5lHFzx4/jcuAqR8/EIZxoqwvqS+At8ljN07Euxu5Da1jzN7X5Xv5VC/wGX2O/GY2kndNtpo3WtGLaRco0lWa6txt+xsFW3WA0NQtMX1w3SNo/BPJBFPPdmQBkxiYuQ0L4FiRxkmRTtfLNpZsquLaadpst/IdFKAeXB9ln0aIC/Z6/eCN38Ii1UWuuJNTRBXG9w8GL5ymbzT5KSM4+zHYuIXbf/8oHmT3vASqJyicqiy1Zneni5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5xBI2xqF4qVsQlQuBqnW/60ExJHYZBT93tVjmNzY+E=;
 b=J4D3+y/FjhP09tuWTM9Q1yMVE0FWo8EeQZL+uNR7MlrktPCUKRGLJr3LKo6y8n0O6J+ejSRFxkfFCyFcs1cr7eQunIqSXuCIKUS7yh9bbdD5iVacK/Kh7lzmh3kH52n83eJ/UgMKxlaKJc+NbMLRCZSx+Dlh7mpGDTTOABhuW5s=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB7135.namprd10.prod.outlook.com (2603:10b6:208:401::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 20:45:56 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 20:45:56 +0000
Date: Tue, 16 Sep 2025 16:45:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] enum: support declarations with a trailing comma
Message-ID: <aMnMgPzLHyRtDS7l@oracle.com>
References: <20250903145104.856314-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903145104.856314-1-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 910fc685-d7c0-44e6-d720-08ddf56208a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mXg/7/cXFRVXOLIEQFZNjnbnRMRUZyQyq/5wfeLnsOVDlg2YOtbmnJx6U4gs?=
 =?us-ascii?Q?q0fBWQZmxM4yshc4kG03d/tlDn12ISWCQKwASU75SZl7AbsX3+nc06wrHoXi?=
 =?us-ascii?Q?ChDVZ1yjD0llFkEitiaxPgpyedPZom6D0SreEgGCnHTEEOjmYEqogtS8htIv?=
 =?us-ascii?Q?wOCmqNrPPscw+gBRiFeDj+LQBLPJDqESM8tLYnBl0pZ0PeaMGxZuUVSIev2Q?=
 =?us-ascii?Q?95nkCsuhK675vxCibgCPxXbRx19Ik6WCLqT4NH1j5MkyE2bnskkZb8/KjCIb?=
 =?us-ascii?Q?k2AbffJ1zJaJEaEY5fqbHAcAuMALNbwPv3k88gc0+mrPe8B6lCGUljbTRrje?=
 =?us-ascii?Q?tZi9klbn8bOCdSKvwI6mSbN9w72VTjqSF7Ep+R6hQGV/4Ac2wroVl2HdIMnn?=
 =?us-ascii?Q?vJFnsSms0aEt+i65s8UVXTSZwCAN61L1MYLMeXEEPa8nReMPnz1SKm6Kojvo?=
 =?us-ascii?Q?i8UqcPHlY6N31/ktCm4Qk9XPVyVbDm1OE15V537Bxk1CTspRyK+vMOomPt4h?=
 =?us-ascii?Q?puW6CHW09hTItNzBWVnFtKiCTAzCtDT2OjfNS6+yIFIcXpXkH5DhuZ3duHQZ?=
 =?us-ascii?Q?ff7ujDf+ygY3VzA2tonV/kEs+PqtYyxC4pQkAUYX6r/ZlM3RyaqOPIPtxinI?=
 =?us-ascii?Q?56UAtzD4z3i3LI883mRaatUQ3nWNlGjdXdtZNG1ULQrcTw6/sjMwyQETri9O?=
 =?us-ascii?Q?yjDW3PcGjL38UC2sK93vr6TCH1FlUs2tPyz71+QjvRBjYtzYM+ZEW5jk1uxm?=
 =?us-ascii?Q?A4FWO7XDJW2TbHaqadXKrhISMjsS3KLyuJHAANRCIj7Rdlu4rn3FUAefi4G6?=
 =?us-ascii?Q?hYkWt0pQTX8LWqhGlB9kHhMONIKOg4icfBEl/1Q4wWJs8quji/yZXdHp/4dz?=
 =?us-ascii?Q?92UaCMxdDOGqFyNl2dmtpk720IaCxoKCxao7RQ54wXwlyxA84tKL3LkPVsR6?=
 =?us-ascii?Q?EeI4CCyTNhJVrubMr55pdzxiN7ujc2Q2KPzwd5bL3iIN92PnZ811v2eMz5Fv?=
 =?us-ascii?Q?lVBTAostSwec4f/GUxcihlLXtAvGWNenyXGi8enOygdz/mV3bW4RiEdHPnDh?=
 =?us-ascii?Q?GZD2P3O+VeP7f91exKdgP1++5PZ5FqJI5HvE90RaB9AkeZlAQac1/V4VYzTs?=
 =?us-ascii?Q?/Kj+EWiFOlFDp1DirS4PfcF1kqIPaNwbKq2gwl5Ra3J10HnzYM/Y+mqBR/3c?=
 =?us-ascii?Q?Ws5GwXtEn+KY92ykw8XHLWhPMkbgMUwIDNcXzSNYowgSnv0Xe5yeLPs4+hWM?=
 =?us-ascii?Q?YZui8sy0f7FitPkosP/5YIrDA65d0JWU/QHoo/sjoOnJ/3Gc09RSUQeRgLmt?=
 =?us-ascii?Q?xak66jAEFRNC3xG0ctBnfER7U2Ji2wmb/u+ftS4VOhcw4QIB/WXYnC9doMsk?=
 =?us-ascii?Q?ac6TFHQX6CwJpEReloyCzV5OJfuj94xTeLLEm2XasOEOBe1vor7cktM+cSly?=
 =?us-ascii?Q?+ND4DVbOR4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?egv3eysLWKcCU5xM02/Alz9AjS7a85GKhqzXS+btXu/WQCbPgefkINMMUKXA?=
 =?us-ascii?Q?854tJ4H6HpOSY92wVVius/1rHNXTSTOE4nktBfy2ApCHCw/er6xPGe1XHczb?=
 =?us-ascii?Q?dxY3RdfDqWrMNAgMDq1ICzu819TsAFijyWWel1Fov+z9abGb5sGlN64Vr9cq?=
 =?us-ascii?Q?zMh5C33Pvvdyf9y72YMZrefTT4zFwKhIsuhRr/3mqq/xxI+pIZZQfipNr5pr?=
 =?us-ascii?Q?dtyAyba0gXQDCJyyIGgaUs4bLKOyATu//m/kzDDnpp2Xsq6ofSbLByUWOq6v?=
 =?us-ascii?Q?9JOYuqppTHffC8Yay5SGK1JA8hCXjJSdKvNbz/n+mMwAbkOWjVyB04gQJm6Z?=
 =?us-ascii?Q?RN6hgokf5vnpOMbsAv+E27Tx8OCn6f+SIe4EdU9YwwCf6c1qACXo6n+ksEo+?=
 =?us-ascii?Q?a47WyCCF8naPM8NIE9PWd0pOmb1Ty2A1pjbiNUnl4a0BThUAUaYRtOMoc719?=
 =?us-ascii?Q?l/ggd9nIR5NTP4AMCkKatsl5nwd1hpHoFsKoreZb3zfKssTHtjnjJNVM6DOD?=
 =?us-ascii?Q?Fnw5UUi0kaAV9UruakLGfF2wam/7tYHSg9fuobaakP7M28Db0O1RTuzcC+vh?=
 =?us-ascii?Q?ygUzVsIABO5/IXIyODRMCj0E/hTl5/ecukssUxMr75Jpj7lOoTeDv1CNiDfP?=
 =?us-ascii?Q?ixtMxPZyfWXMwvMPxs44pxIltNVEu066tM1HBGX4Z8t3z43I6OffMIQtbaZm?=
 =?us-ascii?Q?IeXIU0iQQOwevTSZGYKnJbomvWyJKIfPxEsLXdRUDODJcIFH6JCydacbVpqU?=
 =?us-ascii?Q?x24bUv7X4V8keqAZceO1I+OXxSr+IjH8Yr7H23+gxxOgVOxFf4RnCMiu57KE?=
 =?us-ascii?Q?BhSC34TsDI1yAvI/CLX0MnGUK2X582migjsXKb/thzsznISnvWQ3cv/utfpp?=
 =?us-ascii?Q?z29eElinZMJzIloGkw/8412xor+nmskui4gmL2pw0c70cJyHFTtvgk0rLso2?=
 =?us-ascii?Q?xIgKloglgj4ITqzk2W8RT4J/2mZzyFCuaPLzqq+6XeeAG+bAolKkjQglEyyB?=
 =?us-ascii?Q?xJk0UwaGN+yT3McXetGZaOiKUQVe0s1U6G0rf8qEesdDw84I+7nG3leyPdLb?=
 =?us-ascii?Q?tz8SzgC3H9Fo9rgPDkqvNnwWba84QpZKCNKV70JAHnNOxv9IpcbHVip/VR8e?=
 =?us-ascii?Q?Gy6GIFBhjz1E0E9Jxcyyapy2Pra11KzxvAQM9PnCCnE+9PcWK69eUgBq2NBo?=
 =?us-ascii?Q?d0pK/eFxfk5f+XNKbxD8wuI3ngAFhH2X1D0Z28w7jEw90ntZm8NJpe3gJjVD?=
 =?us-ascii?Q?+vuT4WyuO8KPsKtAaFzRS3l0i/5ZF+kSbERf5r77EjiGLuC/Ld097fCOeqZd?=
 =?us-ascii?Q?RlC7NQCYhIPtg7Q5+ifgGnGuhskX6fejvL2y3NiajC95HiRCC3L71GKaQlrK?=
 =?us-ascii?Q?+rVVBIgW9Ac4XBrbEhzZriFCHELOHSmqjCrxIzRf5lEI8/KHh28o3YsfK85y?=
 =?us-ascii?Q?mByjQFdaxRX6PwCXgXJBfos0zp8wiPaE2DxaLg2MhNh/7TeLfyVWr6M3/m8Q?=
 =?us-ascii?Q?CosOZHP6u0DyEJXS3/ob3eQyLQWSQmGogCv/3Oqi56XIdYydCCCUsM7GK+WH?=
 =?us-ascii?Q?03IimBAvERGWkW9EKmsJBMn/Yyf7pmFK0chVlsoSjoxKB7/2FSPJRCP1luQU?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DL1mgFnarfUtuSPW+ZHgLyq7Pu4Ek/Agt/KhiR08FnvmB/VGShUpDu2Q+EcBUAt3CGrAWFojVoc2TDgyGPkGPVYtfAVta4kS73cN9I5flFw0Hava6QoqGyPHBILmBsGrwqothyf4/TswQyDOcixuzqS+u1B9lbFSkKe+CF2M/Qww7dylraUGx1IYEB3g2Gcf+HGdQeTXMKekh445pWk5njmK0+IES4Stiqeotb55OBWaBvFT0yoGUH2nMDe56XnjNu/+pSq5V40dU06fGwTkxSDdkSTT7ZOb4XhT2/02UNzRHnPnFCW3kZdFMI4vgyK0mgcEqVWKpSyQ5gOmfl8kybsM1aPZv+rjstD65OogO7E47eS/W9imwz8JzuWLWyZHcIyVI8JPO3fSFjOfBY128Twr5qSWBCEM/8+w6FBGT0Lix6qqUz/N8dsZMJtkslq/K1Kwts0I8lr7qLTuYINfMHigGzj2bkFr4/wbn14tzrh/+W87nCtcM19YDuOCwB9PUdY+3LTePEgNCmfklao3731CweoaE7zJLvpi4V7rRYewveqsh24ef2LE9Drhrq2B4rBA/1ppXmLCq54tqZLJVRmVnu1hd2I5BbSBZhzYQoQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910fc685-d7c0-44e6-d720-08ddf56208a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 20:45:55.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXfLQnvSOEzgh5vl1KrOEVtme7LEI8xUPVtCP6AxnBhsaM+gPT8AevpgERUahdbnrUSwTn/kcaZbr+NNG+b395PRWdWM4ueQEQtICc0MTMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509160193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOCBTYWx0ZWRfX2BNDakeCTX8e
 l/zER9BQac2F+KnFlPKab7sU6Wlw1+JcesTlAYg/V2+0E6celoVCn4KH9woZgJ2ds/4+DUSArql
 7mAFZ0trMuD7q93vV72A94otaok5SsXC4T5Y6LdjPwZ/Kmk8tDo1gxkGUHPM+AzrNHaosRwfSka
 xTEmTf8QooqYzFFvffaS1xmJDDOahX8xccFBY31eejVJCXjW1uSzZxfcb7LGttcX1wGkq2htM9E
 dH6PYNZ15BHpV1JVrDofBFXSFFtZfJVfYVbowxAoW/AQPZj4vAXst+uk5QJz2gtByg/tNDp3Wgb
 K1UrjcZJ+vb0jGV/S/oBrNB9npBZvxUpS0veIhDFbwy7k5Vlbs1UPiTOV8PTvG+D+Ez3OI5jLQM
 ZLDCYRD/0TwvUOa1pFfkDjDxGyljSw==
X-Proofpoint-ORIG-GUID: RFEkcxVQr0yo_6JPKb8EaOOBsRUiRk3w
X-Authority-Analysis: v=2.4 cv=YKafyQGx c=1 sm=1 tr=0 ts=68c9cc8a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lOE9Ajf-2MfEJN0doBgA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12083
X-Proofpoint-GUID: RFEkcxVQr0yo_6JPKb8EaOOBsRUiRk3w

Nice patch.  But I think it should also have an error test that verifies that
having a missing enumerator (i.e. have ,, in the enumeration list) is indeed
still an error.

On Wed, Sep 03, 2025 at 03:51:04PM +0100, Alan Maguire wrote:
> When doing python tracing, it was recently observed that #include'ing
> a file with enum declarations with trailing commas fails; this is
> due to the D grammar being strict about the last enumerator value
> not having a trailing comma.  So
> 
> typedef enum foo {
> 	BAR,
> 	BAZ
> };
> 
> is permitted, but
> 
> typdef enum foo {
> 	BAR,
> 	BAZ,
> };
> 
> is not.  The latter pattern is used quite frequently in #include
> files, especially where conditional compilation of some enum
> values is done.
> 
> Relax this constraint and add a test to validate that D compilation
> succeeds with the trailing comma in an enum declaration.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_grammar.y                     |  3 +-
>  test/unittest/enum/tst.EnumTrailingComma.d | 36 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/enum/tst.EnumTrailingComma.d
> 
> diff --git a/libdtrace/dt_grammar.y b/libdtrace/dt_grammar.y
> index 677cd869..7984b85d 100644
> --- a/libdtrace/dt_grammar.y
> +++ b/libdtrace/dt_grammar.y
> @@ -702,7 +702,8 @@ enum_definition:
>  
>  enumerator_list:
>  		enumerator
> -	|	enumerator_list DT_TOK_COMMA enumerator
> +	|	enumerator DT_TOK_COMMA enumerator_list
> +	|	enumerator DT_TOK_COMMA
>  	;
>  
>  enumerator:	DT_TOK_IDENT { dt_decl_enumerator($1, NULL); }
> diff --git a/test/unittest/enum/tst.EnumTrailingComma.d b/test/unittest/enum/tst.EnumTrailingComma.d
> new file mode 100644
> index 00000000..0414498b
> --- /dev/null
> +++ b/test/unittest/enum/tst.EnumTrailingComma.d
> @@ -0,0 +1,36 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:
> + * Enumerations should support declaration with a trailing comma for
> + * the last enumeration value.
> + *
> + * SECTION: Type and Constant Definitions/Enumerations
> + *
> + * NOTES:
> + *
> + */
> +
> +#pragma D option quiet
> +
> +enum colors {
> +	RED = 1,
> +	GREEN = 2,
> +	BLUE = 3, 
> +};
> +
> +enum shapes {
> +	CIRCLE,
> +	SQUARE,
> +	TRIANGLE,
> +};
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> -- 
> 2.43.5
> 
