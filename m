Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389127;
	b=BR+H4ZJ1I6Sk3YqlTpBTI0uuyetXE+jhB7ebdb7wlWRMfPCzeZTVLJUr2xKagLWOnYdL
	 Gi5mYCNMTQaNFReoGb8SNui5H23sjKEZpZHVfKl0AnmyFQ/f1mDhnpxm0wBNiRstgO7R0
	 C22Wo4rVRlGF1wrIWB3AbMm/8TC7x/nCffbyhfcGyKR7fHjL29sJI5VW2vPMbwOxKH0S1
	 1QzfatR8jz7zSl5wBl0ItzNJU1JygoXF2krnkDnFdynI4hxlXWp7vN0PaL961RT5XpHrT
	 rbXIXjCsUYrl/fHN8l6fPIW5/7bIwvBtWEgTEkUK4eG2mYnVoQWypg1WE+zFFxVCRXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID;
	bh=7iaI+DSw/UWImJSYtzhbRIDLoSI3cMLQxWoKoF5x3LY=;
	b=rccjYKt6Rkk1AHuPJuiv5TkosDnDAblM93i3dhw1xrAngrnMrX9Zqw6CzK2KByArl4QJ
	 7X8VmC5xHMoMh5qb0BIER+qVliC3Ef3cv6niDjHRfogPo8Vmv8y5b4FfjW99J14d2JgG7
	 dwrQPqB3HDPipkUfA33vnlo2FkEDYQOOuH15vEAnaDvn4cKFss/VgEW8sy4qRNIlZsIO0
	 eluD3lIeiU71Kw7T/wMeUcyFW5OlTYOklVst9ehDbspqikI7oW0D5hiHS+LDw0aI+FKRL
	 tbI+qkY/Je+U7/NNNS+/WxTAY/fTaMBdlCcx9uZPY3v4XzJ0hT+rAgJn4lMAWbeo6vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=liS2GK3U;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xLkC5IX6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C77606A31C
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=liS2GK3U;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xLkC5IX6
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXSTW437418
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=7iaI+DSw/UWImJSYtzhbRIDLoSI3cMLQxWoKoF5x3LY=; b=
	liS2GK3UC0bkw9LKtbhB+jmS82wKELEBX5m+/SocXBwTTDDd/gWkAd6J5/PKGMDY
	VXd7T5cRjkY4tGQHZk2QdfTd1GPjAM8I9R0TIijHnMAocnjpnzfpP0Sghm/DvM35
	DEKTdSn/H8iNRl25bQLkzlg/Z+VvEXnPxRwmqWxjB8PIA7VguVPovy0Lv5MVCEeh
	03lCZjQsodj5frd8GAW7JVeW7i332/s/cxqC/cid3AP6LCyWWcz23I+sWDzZSTDS
	q75k6OclV3LXtxNmnpYOUeZBHA6uYI3hIY28VX9KNieINNwB9cDc2YIGiZD83NpD
	aJCXguOwnA/x9a4sQ5JWJQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5p1drd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvheQ433679
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:45 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hmyuy3j52-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7KqeeouIwrjZ3gVKu6yPj8NrGLmOeAolc+aQS9YqpsXqij8yRg1qM39dFYuZW1p7fAhJJ+RNpixwijoe3RmplHTkEPVjIEhO0phJiw7qCuqZDErLuKkLY9lHJtS+MgoZsYAPL7HypCvGD6XzEjbtsDMc1fcGSDkfdoiUmnjOAQxDa3wisLsyi9yqgH5Su82KjRHVEcjTHd33iNJKHK0KZkk7LJBZVN072BZBddJ38rgrQonwWZtsxrRXq8N04bUpXitnITaMf6Sefho2jk7z8V+wTN0XRony7lYu8UzZp7V2JR5+yALWjTX7OfBYppv1DUEun9xdp5/ktZ7MdnC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iaI+DSw/UWImJSYtzhbRIDLoSI3cMLQxWoKoF5x3LY=;
 b=wE2s01wjC9MvJeNtrQxqp+qqtLT6VqGxQxlzG8JUECKnVGgFfZOp7rxxW28Nidu9nhxiZYcGah15clQ5K260zwLieDmZRysm8CWnCKyykuzmkg7DiW4g4TwTabcDMEe+vUp86SIShSK/9+vo/ZjzOVjpB/HmMXHtUYyiGlg9r7ZIgKoSQkC+TJ+lIWPllgeAbjihjXLFamSO4yzhrZ5SoxM36WtblaPtz/RiIyH1/y7O0st7CsgK9NCTiw/jy9NHFZXLwJLU0vVQYhjppxJroIAMEil8eQA8spGH73NJsYyxfQEr+inauIbOnKTByO5RPWp4Zv7bwtILAqK7hGU9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iaI+DSw/UWImJSYtzhbRIDLoSI3cMLQxWoKoF5x3LY=;
 b=xLkC5IX692hdlUpcKbWjthjTC5Dmr4tbsRtZcNSyuX6pnh3GUMsltspgVy+qcdFFIgO0KYfekfsofOuODTKXIrbt0/h30x7BCiTTbW5O1Rdu7G12W5RoMLCwAByT4sZ7vtBNMvUAqpFXIQSNlfWbaKoPcRA4MkUYyMUPpLartY4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS4PPF072D269AC.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:41 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:41 +0000
Date: Fri, 30 Oct 2026 19:37:06 +0000
Message-ID: <463fcd5adbd3fd710d2579b5873bb6b5@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 20/20] test: ensure expected output works for older and newer
 kernels
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS4PPF072D269AC:EE_
X-MS-PublicTrafficType: Email
client-request-id: 7924c8b4-c94d-4fb3-9a22-f0bb4d7f5a87
request-id: bf6ef10a-141a-48fe-3cdd-08df36bd66bc
X-MS-Office365-Filtering-Correlation-Id: bf6ef10a-141a-48fe-3cdd-08df36bd66bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	L3NgItrGoLWSKN4x+BLbrwAeu+63M4o4PN+gb02EU+mcDhAvp7lxRrKUrJ2r/uCsB4snoS0L4uXSyfN2Pvbzd4KjUDsr5hxUO9j6XDCNzC3nTOSeCMBaTXnBn2lESeUiQhEdI5ar75KTE+W2TOhbesjUHX2Tw19eYHMNwmtKE3lI6F9SynwSUCL+8dMOiKHOgdQDMHAvEII3EE2BGp5HBOJz+Z/GzLsKpDZ0Hp1pIUc6pR25OzWHDc8O64OZee+49pl0YR3m3DmuZPYR+aC5w/RTqEwpwmsnyV7oKJB+sQ2cn+98JjQAicJlEX1m0GRXPvBhlgxcE3LyWyCz5pVGUvOrFweQp28rwM4cei8f+VWarVzq9qmYDvNHYb+FSXjFdf9CbcwYLYvNIu1eAGrfBtjbMUjuuRnLZpp2ssD5Ryj48kGk9Uo/Y2lcb7u90O0EHry/LQ0869Mk7BN4ins9w7VjrF2+9TgadXefFKrz+5mPGIDEz2z4U6elVbtSzi9ly+WeeI83xnFEzlRHyAPc6wvjbSqcNQhmjgYy1nd3FjKd9injzome7EzlYE6cxQ20jGQPnWcyf8n+4RG6JdkN8ngZHsxF/oFSawg3Oa0K2PMiq66Q+T9F9972YeynLSVn2VeSABOKSUM0lBCvL/D46xjhOC2WeUtpoieNDpYwqv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Pk15qVaB1TXrCYWOqqq7lDZiKesb8G2bT3i8g+R7A64FRyeHuzHosEE3U3B?=
 =?us-ascii?Q?d5PJ39hZ4Fk9gVKgtK2zCeLJw/z6IwkkJzLRUV4SRSba7cTLVvRz4t2vUdnw?=
 =?us-ascii?Q?ThqBLlKGNKlij8Ptx2Hlb3bdSJqN9P43Tj/SA9oedJxcrEDrCOVY+uzw5j6i?=
 =?us-ascii?Q?Ld0tYQbCkq8diOeVcQfd9Ei7aSb9w0zkdlWwZW+HdAmLOu4Ej320YGflOSpT?=
 =?us-ascii?Q?KyrYYtwMhqXuA+shLSt7cykqry3/yq5q6gZwsxA/M3u+H2LdSaCEr9jt0hkQ?=
 =?us-ascii?Q?Yex4lK+SMfmyOhIvFWU2G5RtmwsjMZWjMKOgRBzg7McqE7ad6qiN5a3gjPMv?=
 =?us-ascii?Q?pWCktLL3CWmsM7l0fJf2zjTAPu5Atsqiwwo1oLtopnHlo22Gu2dsqu3sswUR?=
 =?us-ascii?Q?3Mhuc3gNHZS+kPD4LcYaF/ND4HsTCnda02/vZyuNdE5HfH9Pg63fLSm4lswg?=
 =?us-ascii?Q?LYrD7P6DmbLwBy1qGzkTFIrJZKTUaPNpB0kzlAIo88tpnlPwGQ88q2SMyshp?=
 =?us-ascii?Q?DGHiBC2FMgAi5GvrUj6qw9gtFWSDq6fhooWFyu67TEyc4Kfu+2JAv8Q5od9U?=
 =?us-ascii?Q?t55Yhdokw3LFnCrdv35gKxj/mwUwh/Ll5VVQPNiqL7FVuBeSg+qZ9ga1H7x9?=
 =?us-ascii?Q?ou+9K7l35Z/Zql5ua+/ZvQPTA579JRfCEWVf5HT9NPrIWR5eZaVpPzFhspMI?=
 =?us-ascii?Q?chXw/gIR68zl9cX7vcadSg99QmriVYxc9ezDuzfyM7KjkN5ES7EX4RxoEM1l?=
 =?us-ascii?Q?GhEVVX3h6ehYug9nrPtCGsPb29WnonAdbEc+rD+i1lEZ4y6fpKalz2wzBVFb?=
 =?us-ascii?Q?YzY/0khv2FAOZZwyQnuiZsgHMY1BgrjlD3Jl6ymoFaJr/LabLRusuaqnH3+L?=
 =?us-ascii?Q?7i+xuqqwrLchI+NdIQG6llVfAPLvIQiEST4Piu1bW17+pACd1XT+ulWEmw3i?=
 =?us-ascii?Q?dd8/Ua50SgdoV83GAKfbLngeuIhc7oxj5a/j1VB8pmmXeJnSqz9f3i8xbZys?=
 =?us-ascii?Q?PhjH2mcYquwouL3BYa3zNLhJMMbPxl/8559kXD/jcIWWGyvUtJTz6IyO5nXM?=
 =?us-ascii?Q?sLgmHesJ2NhFleyaFQ/fdL3W9tx88RTFezLHVZB0+kyFKdWqqPBVjj7abHJ9?=
 =?us-ascii?Q?beIDQCc+WHXkGbuSrOeggLUjeOFcbD2nWzV7/0DLOaMCKoNKf5UQeZmOoBkq?=
 =?us-ascii?Q?AMPyciwE9DA0VcUi6jZFrqRDzU6x0PpOaj59GTDfe89BTcybYoZul3tWat1A?=
 =?us-ascii?Q?CfNzXVS8HXJ8gUocGB6ZXfMVbZyKvux0Wz3Ilex7ZgcBkrdpWqDtMK1VP09y?=
 =?us-ascii?Q?fC/p/lp7J03xXeNdbRVTcZC/Tm67z7n3p3nFr3Nl0TMfMzcEl84WbkhD5vjH?=
 =?us-ascii?Q?6kiQzY4laNMS13dI4vJtvEpV4l5OJYVTn+/kZmC9mAYPfTzchCk+mOo6C2a9?=
 =?us-ascii?Q?qaoM1WIlxhfTZjmMCu2tBmx7SME3/6L9g0Y5Me2k9BuajpFlJd5SoAOlQdeK?=
 =?us-ascii?Q?aNY8ha4Qu9OkMTFylGC5GpTQoKj55sDLn6GSd5nyKU+kKKW0rahCw5Kn0QUn?=
 =?us-ascii?Q?FLScgS+TWPxUJ55Xznp/juV2yp+7wICB2230MchUxvgDmAOHryjqrNjF/Alc?=
 =?us-ascii?Q?i63F/wstjmjSTmdErYvpsx4RTdTrUvQtjbnXJYRQ1MU2wy/jiIC/UV0VOaiW?=
 =?us-ascii?Q?IzKpFgYDSKXoD8JgLy01ISPyPwRvnQEuHWYZd4Myc2ki3BIZzlQ8Er+F+l+v?=
 =?us-ascii?Q?tKsmRyudncqfMsrIxZcT2FfjCeuA0H8=3D?=
X-Exchange-RoutingPolicyChecked:
	JvM630pO3ruP6elxPh/oO0bHJDEXvcDlncYnIFJaa+xyyIH9Z4zWzMXlmhfS3zhQqvPYs/UdRZr2YGZJAjkAIRjf3y7I8HHNCY+e2PeGB8X4ET1bneErZNYnuGVrcXEgNU2W+G2bCOjBZUfuw4lOW0BMHeWYCdH1lZVSuQd+IZyfu17UegOFaUNQpf0OgxMn2CU4y1KgXOY28Hzv+UwfnOgth7MfmvW1ibMhEhOrJjPB3+Z5vW1mRsGTLj/Po7rJ2OyuC8RmjIeQ6gi6kjsg7ROl7V/uzPGmF+tTaQbWE8XXCKaF+Y3zF01PHHjrVn0Bu3/qE3IvkrO3TFaB/nUl2w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Aj2tqKZo/FzmSIHagD/6j3epEPiwWNf/i9dkUa0u5uGWug4OUB2JqT8VQm+iXPuX07hSF8VbsePfZpqx6UGK145b6Df7VUpKekZ34mgH15A2O+kISSfHD57GlQ+Xua1WFKS0gHazSpSrYnEkDDNxJpH9vudCRwo0eBtKBqtYJRQxYUFmPL041KxDARZuzCujgrXhPzoDgFGeRN+XBAIdWBr2rLWKzuK0b1eo0g0jaNwuEXDDbm64kNNQGpLWQg5mitrIPgPOYlvUtrxxKrVtPy266YR/8DoLhKW4lF9PuODSDTuoXRyUJeF+Ff7W8hh2/+re7+JITqTaVlGH3vYqVlRli4r1Hav0cNvPvhfAcPTO2UOcZwgpa8ZFQFsWxzhoOALPPJlBKIF8ugDKRQKAiDmWvnccBXgElc9JfB18EYyguJtWJH3ZHWmE2zmDk0psvgWS1BAAmU12vNvemMXM3Be5J9BWuG+xOtn8ZA6iLURkubjAhBDo249iIJ4DG6pmMY6sZcVwP+IkLItQfUFpR+rfivFBOusX1UIhVRMbBEIqydlgQmCKxIHm39TXQhC2dkTGSKVs0TtHvGmxAUYaSM77UHp41YTIzmkFr3nHEE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6ef10a-141a-48fe-3cdd-08df36bd66bc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:41.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bU8NAOOqhQzQYcuNao/+mTF9meSSs5/OEmiywPxlocj8gQvCcyBkUsjxjaNgtF9EAPg/OZStVRmM57MbrErQZRkiFs9jn4Jpqtw21Q+uHXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF072D269AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX2g94bSybYSeO
 yVJzYF40QaJrf0QDmzMkR0u2uAJ3SctsDpS6X3zm6VfNQmvWjCczdV0Jgh1p/2WejKYyoTndVD+
 c08Oh9PlHkag6/WTSIdHATe7MRtS4T9QyFAMig1buEfFoC7uO3vXmFcyW40X6qbJEocY6os6+5g
 zkYR0fIAxP3NK4gYKAoeEnDmBsgD6zhuUCffYH+O1ihlgDSNfLCwHGopg2e8pg44CcowOEGl8bm
 HTugWjsZFD9ibuG6OiGun7mexHNxhtJb3w3e3nd5Md/D5UBh2rcl/l12QYbOjXg0+8Dp/s3yCB/
 NIukfKBoV+gjCDttDbSktx/geiQljb15vsL6102geK49696YWUW7A+ki/+Ee8K5b5bHWTKDtb+P
 adsqDmsAEQnmxwhl6hSAkZg6dgPYZV2KXph4YBZqu59GvUXALqTyvedkpvaAHsduvk+nTvd5gRO
 ywaKNIDExAra+vYXz8w==
X-Proofpoint-GUID: i-em-gtDh9n5eZyhU-kgqsS7xQBqzPzu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX5Jb1qowNxBmL
 vqW41ryrXz2sn4JK0zLdEou/aEvPAxEE0OU4/3Wuh8iBmnIenOHm2TOH3wd7zlhyiykhhRaiG+P
 lnOMP2+uF+4/rQ98OEd/1DyQxarBRmu0duRphzRlR5rFBTIDtGsj
X-Authority-Analysis: v=2.4 cv=fKGsTpae c=1 sm=1 tr=0 ts=6ae4f246 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=Kaeb43sj68dllY7_cN0A:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: i-em-gtDh9n5eZyhU-kgqsS7xQBqzPzu

Older kernel BPF verifiers report -EFAULT whereras newer ones report
-E2BIG.  Support both, and also make the tests more robust if code
generation might result in a less predictable jump count.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/options/tst.bpflogsize-cmdline.sh | 9 ++++-----
 test/unittest/options/tst.bpflogsize-pragma.sh  | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/test/unittest/options/tst.bpflogsize-cmdline.sh b/test/unittest/options/tst.bpflogsize-cmdline.sh
index c67dd280..994acb9a 100755
--- a/test/unittest/options/tst.bpflogsize-cmdline.sh
+++ b/test/unittest/options/tst.bpflogsize-cmdline.sh
@@ -39,7 +39,6 @@ cat > D.out << EOF
 BPF verifier log is incomplete and is not reported.
 Set DTrace option 'bpflogsize' to some greater size for more output.
 (Current size is nnnn.)
-dtrace: could not enable tracing: BPF program load for 'dtrace:::BEGIN' failed: Bad address
 EOF
 
 # dump files
@@ -77,7 +76,7 @@ while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 	# Usually (at least in the default case),
 	# dtrace should fail because the BPF log size is too small.
 	# Output should match D.out.
-	if [ `sed s/$cursiz/nnnn/ tmp.out | diff - D.out | wc -l` -eq 0 ]; then
+	if [ `sed -e s/$cursiz/nnnn/ -e '/^dtrace: /d' tmp.out | diff - D.out | wc -l` -eq 0 ]; then
 		echo okay: $cursiz is too small
 
 		# bump the size up and try again
@@ -88,7 +87,7 @@ while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 		echo "The default case is expected to have bpflogsize too small"
 		echo "and fail with the expected error."
 		echo "========== output (expected)"
-		sed 's/nnnn/'$cursiz'/' D.out
+		sed -e 's/nnnn/'$cursiz'/' D.out
 		dump_files
 		exit 1
 	fi
@@ -111,11 +110,11 @@ while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 		echo ERROR: expected only one non-\"BPF:\" output line
 		status=1
 	fi
-	if ! grep -q '^BPF: The sequence of 8193 jumps is too complex.' tmp.out; then
+	if ! grep -q '^BPF: The sequence of [1-9][0-9]* jumps is too complex.' tmp.out; then
 		echo ERROR: BPF error message is missing
 		status=1
 	fi
-	if ! grep -q '^dtrace: could not enable tracing: BPF program load for '\''dtrace:::BEGIN'\'' failed: Bad address' tmp.out; then
+	if ! grep -q '^dtrace: ' tmp.out; then
 		echo ERROR: dtrace error message is missing
 		status=1
 	fi
diff --git a/test/unittest/options/tst.bpflogsize-pragma.sh b/test/unittest/options/tst.bpflogsize-pragma.sh
index 25cda675..342bb3b9 100755
--- a/test/unittest/options/tst.bpflogsize-pragma.sh
+++ b/test/unittest/options/tst.bpflogsize-pragma.sh
@@ -40,7 +40,6 @@ cat > D.out << EOF
 BPF verifier log is incomplete and is not reported.
 Set DTrace option 'bpflogsize' to some greater size for more output.
 (Current size is nnnn.)
-dtrace: could not enable tracing: BPF program load for 'dtrace:::BEGIN' failed: Bad address
 EOF
 
 # dump files
@@ -77,7 +76,7 @@ while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 	# Usually (at least in the default case),
 	# dtrace should fail because the BPF log size is too small.
 	# Output should match D.out.
-	if [ `sed s/$cursiz/nnnn/ tmp.out | diff - D.out | wc -l` -eq 0 ]; then
+	if [ `sed -e s/$cursiz/nnnn/ -e '/^dtrace: /d' tmp.out | diff - D.out | wc -l` -eq 0 ]; then
 		echo okay: $cursiz is too small
 
 		# bump the size up and try again
@@ -88,7 +87,7 @@ while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 		echo "The default case is expected to have bpflogsize too small"
 		echo "and fail with the expected error."
 		echo "========== output (expected)"
-		sed 's/nnnn/'$cursiz'/' D.out
+		sed -e s/nnnn/$cursiz/ -e '/^dtrace: /d' D.out
 		dump_files
 		exit 1
 	fi
@@ -111,11 +110,11 @@ while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 		echo ERROR: expected only one non-\"BPF:\" output line
 		status=1
 	fi
-	if ! grep -q '^BPF: The sequence of 8193 jumps is too complex.' tmp.out; then
+	if ! grep -q '^BPF: The sequence of [1-9][0-9]* jumps is too complex.' tmp.out; then
 		echo ERROR: BPF error message is missing
 		status=1
 	fi
-	if ! grep -q '^dtrace: could not enable tracing: BPF program load for '\''dtrace:::BEGIN'\'' failed: Bad address' tmp.out; then
+	if ! grep -q '^dtrace: ' tmp.out; then
 		echo ERROR: dtrace error message is missing
 		status=1
 	fi
-- 
2.52.0

