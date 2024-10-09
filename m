Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930DD156C6C
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728513047; cv=fail; b=Tbu3zfKOL2u7EYfnfek7PaD2zo9MGcI/b4F4GDuXoMxZkl6CbX5fO7ssif5dpow/h44fBn5QJOmVtxfBNWEj6MUsVdDjSQyp2jcvp++zhRaqTdmC7W9MytJfn46rh759wFDux/4CAW/MLqS87eaC6txgGbSpN+/77lVxC6hCNJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728513047; c=relaxed/simple;
	bh=yBLEFm8ho5jiYiuhCzAb5R7mER8mCTrd0Lhu63AnLcY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=msujJvV50V+rP0oTl99XWVPjWKEosEdhRivO+Z7wDl8vXDrveqER4NYojt/ZgKAhWT37hOfRzYae9bEosVbxhAHOLrM4rhxNWPzuxr0rUe6REBBVQfOvHaTr59Ht5pnJ2aqPTCjSAFBp/8suAjQfs0pMJuP0bvc3Spl2XOpIhoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z9yBx3GW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i0CJVwEf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z9yBx3GW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i0CJVwEf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499LtbIJ029277
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 22:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=aE4pfGglxuswmbmFnZVOBrNM2KQAqeDNkE7rgMCWgYQ=; b=
	Z9yBx3GWKMpjLODr2hDmPwHCJMQU3hao1wQTsiHkysJYJgY0Wj/Bx5PuUIMl3vOz
	hUvcH9Ez2WaEyfKaQiuu4Ja3PrIoU7nk7l4PjElhLPiyAztEd7GbBoBtsWxomw6T
	Q43zsiOiOCFry5w76uZ0IPGumc/pyVyAGuasK4g+Pgz5WLsV14GZw+Oqzx6TSHA4
	t1M1vLuhuwt/rqN1Gis9NkL/o+TJQFBFLuZc/RTCTndJhjO1+4jbwIvP/aBxDcD4
	I6pC2D0AwjSoKs3Ybk2cOYsEcXoUUnozcREkhkwqsGTEuu65Dn1ru3uIB66xBpnF
	H1190CEUjsIF6HnpLf6lqQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423034svyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 22:30:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499KfMcX023112
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 22:30:41 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw98cdk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 22:30:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPdhC70EpaXa0EP2G9ffr2eoKxfV2xXv646Wl90dZLbwJEALdncqBEgabJmPqkPjw3VI1KBBmpz1fX6mp5Cbj9CIGPeCSpUVIdhhC9On7aKCVICZ5NR6rc82WeP4NOktFuq9T9xs275oMsb7cI8VjqdvcZSANA6RSbiexL9PJwm1AnkzGqAE00GMOtypNkTeiafhxUBfOCKoghFgiff9EHTPvFX1YdKSMUSOqqON/Fr5rEPfyn7/bNQI6E60jX7FZ0ucqj1GbZjKYBJUaM8/pP230SrtEYASeC09Xf+A7uepoYq4y+oHs63ucs84QukLtj7x2lPCWas7eo61RzeSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE4pfGglxuswmbmFnZVOBrNM2KQAqeDNkE7rgMCWgYQ=;
 b=lC7khhs6SKsFz62ovxIC51bqP8SgctVamNwaHoyBKHaitdGXTTJxj0kxki8ZdHk7y33rpCAglNyUBAuA56sMQnlrBg5AnR4Nd7RaOges+ixzh+PDgqzNC2RUlJfvQHrbFzdHklkQ/HplOpxKvIVdHPcfO/hiqx1v8T6QUrn8vIwEc28WhvUI8N7RKu7pA5phXCuOAiNXGQyTtPd7RYzdwQg7F8atbVCyon/wWmE+FvTMfEoBYQdgJ2A99NPkSOIcxmh8+Xnb4WSY71ZUls58/HDuo+sOsbHw5pX2bQs3UdRGYWhp0WTNnPhl1djuGRwGjp/KVLsh7jCcMC2cK9nCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE4pfGglxuswmbmFnZVOBrNM2KQAqeDNkE7rgMCWgYQ=;
 b=i0CJVwEf/A5zodIsNzG7iuIXXr99RzNcD85NqF7A7Tuy3pMCrgguLy/ELmewav+Ru14dGVdQr20z5yRmkAWBIxlE/jj8LueRml2v/bQXg6oL0wEtQ+CyXoUrP7WOWVIhgKcusrXGBmWwtuRUOWP2wZhv+BSxY16rjzIsOVSkTpI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4323.namprd10.prod.outlook.com (2603:10b6:a03:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Wed, 9 Oct
 2024 22:30:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 22:30:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] USDT probes need provider spec ending with 0-9 or *
Date: Wed,  9 Oct 2024 18:30:34 -0400
Message-Id: <20241009223035.5659-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b79f8fb-9eb5-4b11-3555-08dce8b1ffe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HSuCvQ3PteOG5ut4vON04s9TnSYoOnPE+avDibNvv8aAp4EpVqh/F8jJ3wRb?=
 =?us-ascii?Q?svlroizbwG9Wm8J36kCn4s5LFYla3S6CdbbWDJK303IvxuB2eNfooNBRbT6Y?=
 =?us-ascii?Q?72bDI7qgRaLeQAaY/E13h1EMVHshRLPJ6Pgv/e+Xbra9N2CrhWhpiNXlt2CU?=
 =?us-ascii?Q?pVdS464oMBqMjTFq7Fo/Hq9jRudU8iUwc50z5uFSr6umftAZz8Q28MOfn1AM?=
 =?us-ascii?Q?T+RklSNkK9D7ZWYztOL9IfbnLvrsqn75Zsn4UuQU5e3nAiAdUpN6yWHB4sIA?=
 =?us-ascii?Q?is2kJ9OVVNqa5VKtwl337M7d1a0d571RPckY6EuZmULszQQciNc5p+7cKink?=
 =?us-ascii?Q?PQNwWUcrnIqpe9x62QFWgoLU7cL0mjXoSxU/Fb6xKEmfPyzRITT4pJZr9jDx?=
 =?us-ascii?Q?EQLTcC0KFf+COwP7pLvtA4uLj3aXSt4l3Wt2uLtXPfCVvLuLgSlMRygE/APf?=
 =?us-ascii?Q?9zsX6EdW33SFVDe1usIwLH8HKZPdMoetRSwTRv00sbwcWiddqRU6Dof1BZfR?=
 =?us-ascii?Q?rYGy2VXnHhfTAfZzl/r5VCm8MXzLsoGUBwIZtf3VF+sCXHS229FI/9aTpkvm?=
 =?us-ascii?Q?tQ9fJ7pzccZKxtOYszRgyL2i2OYgikKpumHQlTtVPiIvY5TAs5lRuT3bKTpA?=
 =?us-ascii?Q?lRdPWETcaAxevl3JgXfcG0YnF7QLeUgJ1sRuN8d08fR12gU+hol68vT/9qod?=
 =?us-ascii?Q?+e5M+CXKNu6+9GjRP+TA2+Ks+G5nG8CVDtqX7NaLodSmxJWdaqrMjkKCpZEA?=
 =?us-ascii?Q?7/bt1GXPGudeeYZ2jN4PzbJjEMuuOnc+GWve99huxqaDTBTc1NcxWVrvKmLt?=
 =?us-ascii?Q?rvbX35A4hHnX9lO4REOfkh4ZyBIV1cBwYx2XBT3mOgkfaQGOzwq7lnZYjZmq?=
 =?us-ascii?Q?utb7rFLmXoJ9nLSOKOsEmCBz0OFfz35kOynBrieSI1mf72S5mzEmwDGYX0Q+?=
 =?us-ascii?Q?SehYXDCOT8OxMclikPkCy7EiZLRd3T8KTT/ro+cVSlvrlSp4yb+vyfPky9Zu?=
 =?us-ascii?Q?YoZ9X0xHEbX2PWRU0rx9RmOXnMSno0G0acpJQKcAk39/MqnjUKlW7sST5T3N?=
 =?us-ascii?Q?FrC/MVlqMzqAWvuTDyIU399vCID6hZ1p1c/dWdHQt1pC8Tt+EJczQdU4j0hn?=
 =?us-ascii?Q?y8Cb2Or+JmlNi4brFl/qLwsMsy6xSp7Y/HI0rud2oTPe1nltqcHYApqyQdiV?=
 =?us-ascii?Q?5F6E3aVrhkqfGuR5rf4wFU8UA0v1RWqMSlQROaLC0/Jvsia78klLerj5KF71?=
 =?us-ascii?Q?8nl7+Px3mMb+WOzqB8O5SMiVGE95oRE2Yd2shIGFwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HaXRNpVM38huZUnTUjkSuhSxn8/npq56jeEHGmWIfWK7lGEfBAloXbBLKADo?=
 =?us-ascii?Q?YJsZj+VZpFn8oeC4pjGKUXedLOzg3UExlrSEupmpUsmmBHTYRNXRfVV/Gnwe?=
 =?us-ascii?Q?KrUc95duHKfinVzCcMIMbkO7+N7XZT6As/4SUrupwachWlebtRWzW3CKcxvX?=
 =?us-ascii?Q?nSfivFeVME/9t+gaoG36K7IkHDsnl7ovG34YjLSWeP8LmJStwBS7vLxXd+Zm?=
 =?us-ascii?Q?D9afgYCWDrBrKttofcSUSlqup9WpsFtRjSmvmQD0mToEZjQY84abQu6F3Ixz?=
 =?us-ascii?Q?Diig/g3vHsbItm4TQijDa3dBGP0dlqyp04kl5YsNlCSa265ASKcJOk6fdoeT?=
 =?us-ascii?Q?giUs86vB8hJPhtTzoBH6ZcuZLXsPh7VXlLDViZOsoOWRIkK28MOdjQyUEP5v?=
 =?us-ascii?Q?cVV17tT91ruoRb5U0oueC11Adg2IuMfv0RcQSi1Gjpa6Hoiir0XfUOEoWLah?=
 =?us-ascii?Q?wgzQwQ4TPvH0bG5/1YrzuyK/szbKd+KplCriD3bZw7vUtxoauABsMzRsN6b7?=
 =?us-ascii?Q?fc0cFKTOKPVmWRDvLMtiR0f72ehv0qgqdiNWHBtWQ+wuf0socO3tS+/l1HcL?=
 =?us-ascii?Q?JEqx77Q54o764pEmcgug6VK+POgO5Y/roYZa3geuWJaLjVPeWM8PVo6ukPbq?=
 =?us-ascii?Q?ValsmpmTviDJsJh9MdLHZOLl5ywwWLayreGcmXfxJGdy4I4jgZ9pk5t9S0jr?=
 =?us-ascii?Q?/qQWXB8S1EK9T/vGm3cYP0+xLi5A3R7za9k8xNZB94vF+qA5GKmaoqcUTvgM?=
 =?us-ascii?Q?BblpPIQI0OxiN1gqMqR1GJPy3oXwvMaJ5QUiG1AzKzSixNmiO5E86LhB0iM0?=
 =?us-ascii?Q?Pn+J0XHbrenmrNT+Fh/agV2AvOZFVdV+Zabv6FMGiNHwA8RG2dJZ+xKjd91q?=
 =?us-ascii?Q?rhZtDbb8do/4yFjZcTgCfT3a/ygZ44lGBA16sXHL+qJMoWjOAAyq7G3y9SUa?=
 =?us-ascii?Q?rs+Q0+59cHKWEZ6QFFP3BqyyzYEjiJWO5OkVpB0xjhkLWIHEpETvbPWVPcyd?=
 =?us-ascii?Q?bqPatUdpLTZUduQBLaJ9QxTFdNIwz+RHlT3TzqcdtjAQ3MYBc0bIxI9YWBCR?=
 =?us-ascii?Q?NwP0z5WiXOowZodYa8dxq4Xu4oJo5gWp0uKXnK6uvuSuV6HnyPfKbf9qA7C9?=
 =?us-ascii?Q?+eDx4hJC9pQv61gUQw/iFWfnYr26rPQXmtnrdjaSnUVo5f0AKSdEW+htlCeM?=
 =?us-ascii?Q?+tK2C5K/hX9ecm5mItE2katj6+bqzgmJqJS/g8QuNzy5cmp70KrZgP02Ai2P?=
 =?us-ascii?Q?aYNHytXood2hMZWvC/FT0YJhmzLl/LJ46urx72Hpffdrp9swy0XdGL8f7tCw?=
 =?us-ascii?Q?sDrS7Bwe2UDHt5HaQZW62WwdzomOCNYdCG660+5tRmlU89hYwY+d2CpUek8T?=
 =?us-ascii?Q?sDy7oebFSZ/U7+9VEr/NPd2t/t5X5qFvfsCK/SVuBL+0FLZKC+vu71NomXjd?=
 =?us-ascii?Q?lb1ucpytrhXW8JwcmYPRq5WcWUhwCUYI5+t8/9uy/8V9ke4KeBSZpVEFAp0E?=
 =?us-ascii?Q?PeXstzHqp/SfnHvGGBIIS6a7M1A54yacTSAGrxGF8Ajn1L6RwWJPgKXxYN3T?=
 =?us-ascii?Q?9B4Bhg99jM0CJsjNVEYEycK6PmU2Z2NCfTQHJtky?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lm/2zOJ2ntd4PKfFhL7cshJQ3RlIBOcmX7YV6p+DqTLvZzNWEzZ0/ZaZ+Lz0BVn1+PBYgVq89LAen1t1HwuzX7Sh8kCL+vZTENwKQUKzKYE4cM5YP8cUcxUE5wTsrNCi4mFjOe3es3/h9oeEZqnFzqwHSV1lJvZVpNWs5bsiHtGdE1wn9Z5Kd35sGnfI2WvMHKtH38+o3WvlRsFzFfaoG6RH5JdxtwzuPgFmQRMDJfZXkHIqDoDXEz0x0NrKOH+xg6wAPIz4yMD6rfsDFHHA6bIi/5P0rEWEE8Y4RQ+l7gnBezGtT+D2CH5b/0nQ+xEWgwLXT7eyPx0NWGSI7+cy3g4S3wuukh2XfRtugvZbdj+CmyusZhac5r1PboqTGWAV5mifTxDVF+YtjFByOaPlpqYadKv7zbUXZO85n15yd7UaYg6BRVF+m0Owd+u4N7oED8i53uKrBiRG+/4+mq3isO+95YsvJ7UCsD9II787nTedCCzt95+s7W4VdWFMcEhC4JMWpm+FLEjLqHUlCz1ULwNwKeXQ9YQH3WaT+CyQqkp3NeRGDeMGSCR3bSuiBaB/7RHukxHT02CAiCh1o14qQUX9ZVrxNR6UVOcT9mfzF6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b79f8fb-9eb5-4b11-3555-08dce8b1ffe9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 22:30:38.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFe6hdThTakZs83HqQt0vN9ggzM96qEJnBFCHl8q7RrLTX1PelwWMp8RSQXfMfCy3gK6mN6B+cY0r2EmbdN4BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_20,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090139
X-Proofpoint-GUID: mgOxDYPysysI1c9W92OgURD4liYuKhDI
X-Proofpoint-ORIG-GUID: mgOxDYPysysI1c9W92OgURD4liYuKhDI

From: Eugene Loh <eugene.loh@oracle.com>

We can avoid the globbing when the provider name is inconsistent
with any USDT probe.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 62060b592..3f9e3052b 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1151,6 +1151,14 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 
 	assert(pcb != NULL);
 
+	/* If it cannot end with a pid, we're done. */
+	if (pdp->prv[0] != '\0') {
+		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+
+		if (lastchar != '*' && !isdigit(lastchar))
+			return 0;
+	}
+
 	/* If it's strictly a pid provider, we're done. */
 	if (strncmp(pdp->prv, "pid", 3) == 0 && isdigit(pdp->prv[3])) {
 		const char *p = &pdp->prv[4];
-- 
2.43.5

