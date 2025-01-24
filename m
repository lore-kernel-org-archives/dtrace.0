Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5D23C8A1
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943661; cv=fail; b=s9n9VCD5PIHlmAEXyf0+gRNuUD2EprflJp0Hb/3K4zUh0CDS9maiUT3v7ssIpAX+i1OT3iVXramW1YTChF+AalM+Y7+UOyeL2wq/3ohGyXR2wyUVRdkP16j1YVSi8jPMwaOld28xTt7OzsY9a1/6xrQgI+Q7o8c3caopJPnosQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943661; c=relaxed/simple;
	bh=2a76p8pVJ6kSYuKiLF7T7cAJ639+LhGtY1rQONaJc7E=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=kk3B0ITjgChmdE/ssAZr2N/d46Ww4NH7MHEYpQ5q9pOv/wNt0oIT+i/aKnfK0SECjf11T8h1xLjhCdE4vMrqSvrrFj5TjAm2yLsPNk0/VR94qO2wZV8SQQurMjbUIaJArKa2/UuN7Qp54EBD/6ZTrubEPVHzIG/wrdpFlQ5RgpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OBBKRDP+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jTTU5uHI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OBBKRDP+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jTTU5uHI"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517F6vd4002695
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 15:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=NDa4y0qkb6M4zl3egdCeeN2qDnz6uBoiQJ7NDrFELb8=; b=
	OBBKRDP+8QkSCGp6ymxws4J4EYqwtx8jI5DRdhDWVVEsxQV5lmTevgNY4xNtThcd
	xA8OisH/72UI1SSHZosN59YdYOooP2olalB+YCeulgPeVy+eDDIZWWF2O7ayHeqX
	3XwezPRPgPLbOup4rPThiE9HeHZZDtIBuYLkos+ye4CRVImqo1oSTCwZ1MtBaKzc
	2OvX7OjLPQxnvxmQ3vro6nbjw0UmsBuc7bWhAlV0nlHGAWGFAJ0XFYZriAng9ycg
	UVxlvRM1hZ1SIZch2VTZqVSry0vsJhF8scyVKOYiGV0Yk+WUdv3B+z+HPTaunu4r
	Fz1BtVl/MzXB+fzuEaXBGA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44mqk8b19j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 15:54:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517EBdMS022628
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 15:54:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8ec20vs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 15:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vf1Z3CsiDBbZ/KFIm7+ISRppnr6hyBkZojrF4e+1JMTvKiXiJCTXXeNcJYZJtKyZ8Jt6VhAe1UQ44i4qC/ZDUZH9JvNXRn6a/JuJVLAMjIS3x4oSPMjBsBIPXN92oYychOYWVCJqwJbMjRYT2bNqPBGYFJigIYZ3UtlXn/nm/jQ3GNulOWB2YB76Md2DOH9M2kIhzgHPZqjrQV6E26SWrKXYpGu9Yyx0qcBkyuGvfznm0SvIVmPdN1moc9P+8UsR4edGh/YRDbuAoQ9Zd/4AMiD/d+nCcsjf5n6qcb2u8+CdvbyfyoviQG+45DwZWLXYwOa+ZlkEoQJLKqGL1uLQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDa4y0qkb6M4zl3egdCeeN2qDnz6uBoiQJ7NDrFELb8=;
 b=kaSTFoPaZKBPlquKpz/SHlnpdYkaIdLcB7nK1ShbCVF3+bt29jijHgNiFlxLAwzY6cZJPNhbasH64JV+LHLLeLviZXUUh8UYUzhKw7uk1nDPDK2pSNdvmhruqtuhQMX9STkFfFv2UG23EtNW1LRBVxavqg6d/TxJrSYxqg4ENj79GklUhler1+BeczavcILe6vfiyH3uSLAnrv2n/d2fl9hMOwFZ2K1JLLhy6ubjEZXnztHIErMJ4egIM38rfZIXvR61TZRb7gLN1SQlIExFrO98J/4UccKVpxlSLuGpeuS2TKQBH/UY8eveOpBc1v5z/PNzvQZrCpbSorEL9LWtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDa4y0qkb6M4zl3egdCeeN2qDnz6uBoiQJ7NDrFELb8=;
 b=jTTU5uHI1zo7pOjmsp+urY47StaiDJj11LJ9zUcjvxKf9ScHqHBKNnMMltgaWSLTDq/VH/2ZkPkMuSgGJJYBxssBafU2G5fv7Jvl8raLhqdK9J1xalgREktNIauVz+9sHeiC2ga+E/00S5d2UoseCrmEUVG49PTkU4XE+rt9IQ8=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by PH8PR10MB6313.namprd10.prod.outlook.com (2603:10b6:510:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 15:54:13 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%7]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 15:54:13 +0000
Message-ID: <4ba6cc25930511a2786d92a629edc0ea.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Fri, 24 Jan 2025 02:17:54 -0500
Subject: [PATCH v4] procfs: implement execargs for pr_psargs translator support
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|PH8PR10MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: b53cae10-272d-40bc-68d9-08dd478faaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AsMDIHcaMuLwofsORvUYgMOe71Z2oNDuHvSZmQ4ogCqJ1j8W9+HQz/PVMeDH?=
 =?us-ascii?Q?6Wm8ePA6oeDjxzVZL6KRVVb/nPrYaTf/RuwQtuf6FgItfTIn88Jq0L+0PsnV?=
 =?us-ascii?Q?dkPdNkWiRwlvadfq7JsDaSDJKpcHUvu4HsKO/E3IVvIRpb8hgJzFJmZD2jqO?=
 =?us-ascii?Q?FVQ6QcerYukbIiauhRJCJO72ZfuIngpqH5vCBvidEERsh6LDUYigOAXKn0u+?=
 =?us-ascii?Q?O2CvjFfjyeZ/M+suk8pIHhxAqIgam/SD4WMxI1oaj+Vsi5LkqxEDHFTdbj2T?=
 =?us-ascii?Q?uIe0aaeCS6CRiANLbGjatFHVIWu6kZL8lozUc0oVOrzTPk9nyaKtT5AIvEEv?=
 =?us-ascii?Q?mpmTECgtjCmuj2Q7JtGkkaKXfKnrG2qYhxt5Nlq/Id04sEav/l1E/Lnlqkqv?=
 =?us-ascii?Q?G0BysXwaicYycrYKR4w2mmBJjFSsG8hbsXgvo8hQB+/7Ry9axqmp4ipeR9jS?=
 =?us-ascii?Q?QvtAVi+PbVV1SxMsS66nJyKSnL8oQu/uW3P5N9kv2ua+I6ncVr0/N58bAYHd?=
 =?us-ascii?Q?ecPy80Y1ck7nP/JQTvXzKTzfm1En3Skoq0420ZWdZiI8Z0c63zvEIDTVCxyD?=
 =?us-ascii?Q?JmP2gIWOCyHh7JxnlJyO4rOvzvzKIuDXYBbiKDN2x1lS0YFgZytlHggAox7t?=
 =?us-ascii?Q?p17wDsivZWL7XEMSb1//FAVqhgclXo8iOvHVd2uFBYHD1Xkm/37bAjmYFY8d?=
 =?us-ascii?Q?hYUfK1BiMUt9jV2FC75JaiVHucGTOvkGaG3zYyE0JtkbL6aALa82WGOMGrQB?=
 =?us-ascii?Q?Ro6FrgONa+sZcMpm+0Qw/r7/O8IY7gp+mS6WaNfKiyRkEY7ljrlgbU9xIcXm?=
 =?us-ascii?Q?iA6mwjYCkpUixxG40d7kVXvFLL8zmjCoMztOanvL/su+pBiljBkIp/pe5I7r?=
 =?us-ascii?Q?IdweTPGK0FMS4UVZb/fS2JzkN3+4W1fWX3WGYH+9nvLrehJTncWBbs5Rs2hT?=
 =?us-ascii?Q?i//+IXqQm7RvJGHtDV1mgsCneX6BOtucfZF+Bq8pZrHSf9fQYosq94eO5HeJ?=
 =?us-ascii?Q?gwEr84JI5EEnautv2HmQzP9iqWWWVT+M6Ak9Mt+tXVX6YbdEiB1NjkuQ1JU0?=
 =?us-ascii?Q?PDGrUdd4yDPBMBesF070iM6XhhQtGputNZMok2AzemWh/DRpYvGeHJYmMVoQ?=
 =?us-ascii?Q?mr+sQdi92lJTEXXLlejpWC6GsjfypUGo7i+0/335Q72pvwc/aOu/g0bHvfzZ?=
 =?us-ascii?Q?1sLMpqsEhXYz9t0XET7ZB4lWyZDCwA82iZzgLrLk3UhXy9LVE5RN8Rlov9t8?=
 =?us-ascii?Q?CRyMs5ji1yMmLvOL0pGuSdjDz8j1XgDIT5WnmE1dnjP/pStDUGg1z7DyZp5g?=
 =?us-ascii?Q?bihigNVL4OTdg1vYvTFu5Ee9v1gF5l7ajj2Jl6n4XLkPDw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ajoUaAaUpM9wHirXG6GEYCvVqbEjXPaHjQKeKeTqXnXcHt+YyZPmRI0uJitC?=
 =?us-ascii?Q?PDeqyvtc2bXunrDCsId2qB3oWu+Si9JxqzYIaf/+K3n7oN3FshFuIi3YzNTE?=
 =?us-ascii?Q?5k6B4FVRNE55R27cYG7cTlf7zTlupLRvaLrOCXIYkgZBgsQjl3Q9isllTG3o?=
 =?us-ascii?Q?nyJaLNSkJLVxhc8kp0FtFjjGASftCERZ9j210IZcdgN286GwiplJH9UC0CwN?=
 =?us-ascii?Q?TvQM+uT53cB93PHmjDu+2MjqNuNle9uU7TTHkRLiEOqmo6v50rWQqkTEUYC0?=
 =?us-ascii?Q?eSOFREaHfJ1HvhHF9zBoz3CjLrGaD9WOkVgXgDQvSGUOd0wauyMSVlo8VVZD?=
 =?us-ascii?Q?EPo4KaVyZzXkZEzsdeHz6zlejXecBJ8UHgoayx74fm0c9VAOWUnh4a/WiXAP?=
 =?us-ascii?Q?u/JT8FGVZMbcqmkM+3Rj7IJxM0UJ/UOBPh+zW71proFygnHg7zvnKtCpRlDw?=
 =?us-ascii?Q?Ukb+X0OIn3wpvzWtPbZ7aqy+fkDGEYzOgT0BVjRGVW9C3kFFBH+fy7G4HEAz?=
 =?us-ascii?Q?QluphXhI8ZH0h8JPKcnj6R0SXoyJ3k46Pm8QvPBB7ROAnzDixnkaakhiKNSB?=
 =?us-ascii?Q?i/R0R1SAuly3vMmxk4u6Ck0jxCyMnDNuptcgt5vE9KukvvWFOQPmqzs2zsOc?=
 =?us-ascii?Q?FeyLT7fCE0BG518C5TtIkdPFmNqknpVlUxu/29SsDchgHOtd2zOpUkJkcT1j?=
 =?us-ascii?Q?C8PDvHj5vb0bVBYOFMfjibnthosbr3ZWfVd6Fne9OjMIMpWgKnBIFFHU59NY?=
 =?us-ascii?Q?FlsjEls0BBV1AkJuYqFPVk6TPOfX/mQmEZtBKzs6rhjdaLHi9hjBEGnVsV7R?=
 =?us-ascii?Q?Qlu12mjx1uiQ87+4LFRjmDduw/J7ByKjZjARF24aHee1M3TbjCLQG8IM1+oq?=
 =?us-ascii?Q?KIfWU3u2lMtDhAfRP/bKMVdxUIWTHFiQlRdKcAmgz7gYr4AbWvpSClXnESdV?=
 =?us-ascii?Q?iEXu55AM/J+hHG7d7G+oKNRILKPMIUYBS6SfU8FLfbMDMX+uF5L7wYMumeA7?=
 =?us-ascii?Q?WS0zRDHfe+8ziPChgKWTQA+rMP/9T80swIZsiTgaEiSELEzH+OB9eG7Uosrk?=
 =?us-ascii?Q?9kWGx5iJEjVKZp7tdbP+Z8QSkkah+5GhYOanr+l59CG09IstkL/iXcJVZeJU?=
 =?us-ascii?Q?tnAa+tUT7MNpTc9cI87iVrKYMGgCyRaddkM8giZs/SYdVU2grIvKaiUmgd8C?=
 =?us-ascii?Q?kyVHPkDgrzVO2GA6Dvbo7HV4e12Od+XKLb3ish/CE/xT+A8PZKUBd1Ib9/7X?=
 =?us-ascii?Q?vSHTtjQH+11uF7k9SaQhA+oo5hceOaKygvJljnsrkTRj5F2A8DLOCaNRHwvz?=
 =?us-ascii?Q?qJv+0lI1kEbMwfoXIY67bcmVVaUoVdL82OvUzgi+tK/QhtBfOYDJWk9hgCBD?=
 =?us-ascii?Q?qMTAZTlZ2ubfy5kAbaCnDUOt9KOtDfQXSqtMhkZ2YwuGxsCic/yjPJnDii51?=
 =?us-ascii?Q?uRaNZlx6HOxsDt108J1ffErIgKTUCJ+VtaRGdL7wC0Rde1bMpJ4ZNoiHe9t1?=
 =?us-ascii?Q?B6+GvmEtjH5A/HDeEZjDBsN/ab7KHttXxJdCxPxmP/PuQDFAtHpf8aCo7qs7?=
 =?us-ascii?Q?wIkJg5HhXri10Ccyenkj+PfxRaP5EfhQdFCf9vLRjfYtzQhCHrOFTKxDUtZx?=
 =?us-ascii?Q?c2fBqhVzXJutqIX3H99ZjWo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e9yfXUjXEU5z+vv8QQcVxaDEyxfD/33uoY1HwZTJcYTWdMFfuxKiYDOajyN1Fi6IlezOvgqyydn73688WysAune84xl4ISYNQa/gnWTRj8Ovd/oJXY5V34TA0HOv83eettqeQtmOAQCbr0rIrMPB+lLKKACTxY8hEQIkqJC18TCSKQ5GfuqrDJb0HailoFZoLKSH/hGjsa91d8N2Nye5kUOvLZWhzveDI5ZIz2bxgeNhBpc/eUaFpU/C/neYGhGiMtYMVXBilWiDUox0tlVkdMzw7YrEHU6BIHjlqK1tJUdiIf4yZZCAck5ak5C+XRHIv1f87CHSifPgoWj2J0OiRul1PY5DNmAYJE81PQK4w5tkJIJDLaW+iU1G4+gpZGkc+n8mh9mx2Pd6uj5UKtmd4k7sesPGtv3Kr7rWbhNyF0qoYiauRVHk5pVpZUs6UzcOMLPVAy1DgYvaIVHoC45pUA4ofEtBSfpvJ0ckgl2XSlb2XrlxICWac2yJ2B7M41ihhZr0ypS+X6idbSTLt00ORRsT7bYevh3lYq6x9p2Xz/ADKvCK7ED1EFb2Rm23AjAoxWicHSXizBvTjQvVqF0XUl1a1ohUfnDv3Rm101rSBT0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53cae10-272d-40bc-68d9-08dd478faaf3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:54:13.1626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0uVjBIEafyz899Yr7sUoNvaBqJ/FY1clNJ9Xcw10ZJBNxWRx0x+hm3waQfsUMuxU+P/uQlB2T07G9rvs/S1bQHeKag7r3j835RjxFsZgN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6313
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502070120
X-Proofpoint-GUID: aUIeBQW62LOoaaFUHvwMtUfNDztTypym
X-Proofpoint-ORIG-GUID: aUIeBQW62LOoaaFUHvwMtUfNDztTypym

Implement a new execargs built-in variable to provide the ps-style
argument string for the current task.  It is used in the psinfo
translator for the pr_psargs member.

Due to BPF limitations, it is only possible to retrieve this information
for the current task.  The data is stored in the task's address space,
and the only BPF helper that can access data in another task's address
space is not allowed to be used in non-sleepable programs (such as
tracing programs).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/Build                                     |  1 +
 bpf/bvar_execargs.S                           | 97 +++++++++++++++++++
 dlibs/aarch64/5.11/procfs.d                   |  4 +-
 dlibs/aarch64/5.12/procfs.d                   |  4 +-
 dlibs/aarch64/5.14/procfs.d                   |  4 +-
 dlibs/aarch64/5.16/procfs.d                   |  4 +-
 dlibs/aarch64/5.2/procfs.d                    |  4 +-
 dlibs/aarch64/5.6/procfs.d                    |  4 +-
 dlibs/aarch64/6.1/procfs.d                    |  4 +-
 dlibs/aarch64/6.10/procfs.d                   |  4 +-
 dlibs/x86_64/5.11/procfs.d                    |  5 +-
 dlibs/x86_64/5.12/procfs.d                    |  5 +-
 dlibs/x86_64/5.14/procfs.d                    |  5 +-
 dlibs/x86_64/5.16/procfs.d                    |  5 +-
 dlibs/x86_64/5.2/procfs.d                     |  5 +-
 dlibs/x86_64/5.6/procfs.d                     |  5 +-
 dlibs/x86_64/6.1/procfs.d                     |  5 +-
 dlibs/x86_64/6.10/procfs.d                    |  5 +-
 include/dtrace/dif_defines.h                  |  1 +
 libdtrace/dt_bpf.h                            | 21 ++--
 libdtrace/dt_cc.c                             | 33 ++++++-
 libdtrace/dt_cg.c                             | 26 ++++-
 libdtrace/dt_dlibs.c                          |  3 +
 libdtrace/dt_open.c                           |  2 +
 libdtrace/procfs.d.in                         |  5 +-
 .../builtinvar/tst.psinfo-bug21974606.d       |  4 +-
 .../builtinvar/tst.psinfo-bug22561297.d       |  8 +-
 test/unittest/builtinvar/tst.psinfo.d         |  8 +-
 test/unittest/builtinvar/tst.psinfo1.d        |  8 +-
 test/unittest/proc/tst.pr_psargs.d            | 36 +++++++
 test/unittest/proc/tst.pr_psargs.r            |  2 +
 test/unittest/proc/tst.pr_psargs_other_task.d | 37 +++++++
 test/unittest/proc/tst.pr_psargs_other_task.r |  2 +
 test/unittest/variables/bvar/tst.execargs.d   | 23 +++++
 34 files changed, 312 insertions(+), 77 deletions(-)
 create mode 100644 bpf/bvar_execargs.S
 create mode 100644 test/unittest/proc/tst.pr_psargs.d
 create mode 100644 test/unittest/proc/tst.pr_psargs.r
 create mode 100644 test/unittest/proc/tst.pr_psargs_other_task.d
 create mode 100644 test/unittest/proc/tst.pr_psargs_other_task.r
 create mode 100644 test/unittest/variables/bvar/tst.execargs.d

diff --git a/bpf/Build b/bpf/Build
index 3e43f4b6..a9fb100a 100644
--- a/bpf/Build
+++ b/bpf/Build
@@ -23,6 +23,7 @@ bpf_dlib_SRCDEPS = $(objdir)/include/.dir.stamp $(objdir)/include/bpf_asm_helper
 bpf_dlib_SOURCES = \
 	agg_lqbin.c agg_qbin.c \
 	basename.S \
+	bvar_execargs.S \
 	cleanpath.S \
 	dirname.S \
 	get_agg.c \
diff --git a/bpf/bvar_execargs.S b/bpf/bvar_execargs.S
new file mode 100644
index 00000000..1c47cafb
--- /dev/null
+++ b/bpf/bvar_execargs.S
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Oracle and/or its affiliates.
+ */
+
+#include <bpf_asm_helpers.h>
+#include <dtrace/faults_defines.h>
+
+/*
+ * uint64_t dt_bvar_execargs(const dt_dctx_t *dctx, char *args)
+ */
+	.text
+	.align	4
+	.global	dt_bvar_execargs
+	.type	dt_bvar_execargs, @function
+dt_bvar_execargs:
+	stxdw	[%fp+-8], %r1			/* save dctx to stack */
+	mov	%r9, %r2			/* %r9 = args */
+
+	mov	%r6, 0				/* set %r6 in case of error */
+	call	BPF_FUNC_get_current_task	/* get curthread (T) */
+	jeq	%r0, 0, .Lerror
+
+	mov	%r6, %r0
+	add	%r6, TASK_MM			/* %r6 = &(T->mm) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
+	jeq	%r8, 0, .Lempty
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
+
+	mov	%r8, %r6
+	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
+	jslt	%r8, 2, .Lempty
+	mov	%r0, STRSZ
+	jslt	%r8, %r0, .Llen_ok
+	mov	%r8, %r0
+.Llen_ok:
+
+	/* read data from arg_start to arg_end */
+	mov	%r1, %r9
+	mov	%r2, %r8
+	mov	%r3, %r7
+	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
+	jne	%r0, 0, .Lerror
+
+	/* loop over args and replace '\0' with ' ' */
+	mov	%r1, %r8
+	sub	%r1, 2
+.Lloop:
+	mov	%r2, %r9
+	add	%r2, %r1
+	ldxb	%r0, [%r2+0]
+	jne	%r0, 0, .Lnot_nil
+	stb	[%r2+0], 32
+.Lnot_nil:
+	sub	%r1, 1
+	jsge	%r1, 0, .Lloop
+
+.Ldone:
+	mov	%r0, %r9
+	exit					/* return args */
+.Lerror:
+	ldxdw	%r1, [%fp+-8]
+	mov	%r2, PC
+	mov	%r3, DTRACEFLT_BADADDR
+	mov	%r4, %r6
+	call	dt_probe_error
+.Lempty:
+	mov	%r0, %r9
+	stb	[%r9+0], 0			/* args[0] = 0 */
+	exit					/* return args */
+	.size	dt_bvar_execargs, .-dt_bvar_execargs
diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.11/procfs.d
+++ b/dlibs/aarch64/5.11/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.12/procfs.d
+++ b/dlibs/aarch64/5.12/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
index 584ac325..ef27bb70 100644
--- a/dlibs/aarch64/5.14/procfs.d
+++ b/dlibs/aarch64/5.14/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
index 5aabc6f1..cad2d2c5 100644
--- a/dlibs/aarch64/5.16/procfs.d
+++ b/dlibs/aarch64/5.16/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
index 683ff5a8..6b1b1b9c 100644
--- a/dlibs/aarch64/5.2/procfs.d
+++ b/dlibs/aarch64/5.2/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.6/procfs.d
+++ b/dlibs/aarch64/5.6/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.1/procfs.d
+++ b/dlibs/aarch64/6.1/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.10/procfs.d
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
index 7274554e..f0071440 100644
--- a/dlibs/x86_64/5.11/procfs.d
+++ b/dlibs/x86_64/5.11/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
index 7274554e..f0071440 100644
--- a/dlibs/x86_64/5.12/procfs.d
+++ b/dlibs/x86_64/5.12/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
index d1cf90d3..17f95e5c 100644
--- a/dlibs/x86_64/5.14/procfs.d
+++ b/dlibs/x86_64/5.14/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
index 5aabc6f1..f924c2a1 100644
--- a/dlibs/x86_64/5.16/procfs.d
+++ b/dlibs/x86_64/5.16/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
index 35538862..36608ad0 100644
--- a/dlibs/x86_64/5.2/procfs.d
+++ b/dlibs/x86_64/5.2/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
index 7274554e..f0071440 100644
--- a/dlibs/x86_64/5.6/procfs.d
+++ b/dlibs/x86_64/5.6/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
index 5d7873b5..a3d7f949 100644
--- a/dlibs/x86_64/6.1/procfs.d
+++ b/dlibs/x86_64/6.1/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
index 5d7873b5..a3d7f949 100644
--- a/dlibs/x86_64/6.10/procfs.d
+++ b/dlibs/x86_64/6.10/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index c8c1d961..9f6e3b55 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -162,6 +162,7 @@
 #define DIF_VAR_GID		0x011f
 #define DIF_VAR_ERRNO		0x0120
 #define DIF_VAR_CURCPU		0x0121
+#define DIF_VAR_EXECARGS	0x0122
 
 #define DIF_SUBR_RAND			0
 #define DIF_SUBR_MUTEX_OWNED		1
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 6518de66..85934d2d 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -47,15 +47,18 @@ extern "C" {
 #define DT_CONST_TASK_TGID		12
 #define DT_CONST_TASK_REAL_PARENT	13
 #define DT_CONST_TASK_COMM		14
-#define DT_CONST_MUTEX_OWNER		15
-#define DT_CONST_RWLOCK_CNTS		16
-#define DT_CONST_DCTX_RODATA		17
-#define DT_CONST_RODATA_OFF		18
-#define DT_CONST_RODATA_SIZE		19
-#define DT_CONST_ZERO_OFF		20
-#define DT_CONST_STACK_OFF		21
-#define DT_CONST_STACK_SKIP		22
-#define DT_CONST_NPROBES		23
+#define DT_CONST_TASK_MM		15
+#define DT_CONST_TASK_MM_ARG_START	16
+#define DT_CONST_TASK_MM_ARG_END	17
+#define DT_CONST_MUTEX_OWNER		18
+#define DT_CONST_RWLOCK_CNTS		19
+#define DT_CONST_DCTX_RODATA		20
+#define DT_CONST_RODATA_OFF		21
+#define DT_CONST_RODATA_SIZE		22
+#define DT_CONST_ZERO_OFF		23
+#define DT_CONST_STACK_OFF		24
+#define DT_CONST_STACK_SKIP		25
+#define DT_CONST_NPROBES		26
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 29cfbd84..1dc119ea 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_TASK_PID:
 			case DT_CONST_TASK_TGID:
 			case DT_CONST_TASK_REAL_PARENT:
-			case DT_CONST_TASK_COMM: {
+			case DT_CONST_TASK_COMM:
+			case DT_CONST_TASK_MM: {
 				ctf_file_t *cfp = dtp->dt_shared_ctf;
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
@@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				case DT_CONST_TASK_COMM:
 					rc = ctf_member_info(cfp, type, "comm", &ctm);
 					break;
+				case DT_CONST_TASK_MM:
+					rc = ctf_member_info(cfp, type, "mm", &ctm);
+					break;
+				}
+				if (rc == CTF_ERR)
+					goto err_ctf;
+				nrp->dofr_data = ctm.ctm_offset / NBBY;
+				continue;
+			}
+			case DT_CONST_TASK_MM_ARG_START:
+			case DT_CONST_TASK_MM_ARG_END: {
+				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_id_t type;
+				ctf_membinfo_t ctm;
+				int rc = 0;
+
+				if (!cfp)
+					return dt_set_errno(dtp, EDT_NOCTF);
+
+				type = ctf_lookup_by_name(cfp, "struct mm_struct");
+				if (type == CTF_ERR)
+					goto err_ctf;
+
+				switch (idp->di_id) {
+				case DT_CONST_TASK_MM_ARG_START:
+					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
+					break;
+				case DT_CONST_TASK_MM_ARG_END:
+					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
+					break;
 				}
 				if (rc == CTF_ERR)
 					goto err_ctf;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index b48e27f0..5268e900 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3341,7 +3341,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	}
 
 	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
-	/* Special case for arg0 through arg9; encode as args[n] */
 	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
 		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
 		idx = idp->di_id - DIF_VAR_ARG0;
@@ -3351,6 +3350,31 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		   idp->di_id == DIF_VAR_PROBENAME) {
 		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_probedesc");
 		idx = idp->di_id;
+	} else if (idp->di_id == DIF_VAR_EXECARGS) {
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_execargs");
+		assert(fnp != NULL);
+
+		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		dt_cg_tstring_alloc(yypcb, dnp);
+
+		if (dt_regset_xalloc_args(drp) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_1, DCTX_MEM));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, dnp->dn_tstring->dn_value));
+		dt_regset_xalloc(drp, BPF_REG_0);
+		emite(dlp, BPF_CALL_FUNC(fnp->di_id), fnp);
+		dt_regset_free_args(drp);
+
+		dt_cg_check_fault(yypcb);
+
+		emit(dlp,  BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
+		dt_regset_free(drp, BPF_REG_0);
+
+		return;
 	} else {
 		char	*fn;
 
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 07d22afd..9ad4f5e7 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
 	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
 	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
+	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
 	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
 	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
 	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a0205887..51c056b2 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -153,6 +153,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	&dt_idops_type, "uint64_t" },
 { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "int" },
+{ "execargs", DT_IDENT_SCALAR, 0, DIF_VAR_EXECARGS,
+	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "string" },
 { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
 	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
 { "exit", DT_IDENT_ACTFUNC, 0, DT_ACT_EXIT, DT_ATTR_STABCMN, DT_VERS_1_0,
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 038cf69b..adcb1889 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -179,9 +179,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/test/unittest/builtinvar/tst.psinfo-bug21974606.d b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
index 68d9503d..67fea54e 100644
--- a/test/unittest/builtinvar/tst.psinfo-bug21974606.d
+++ b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To ensure pr_psargs does not have an (extra) trailing space.
+ * ASSERTION: To ensure pr_psargs does not have an (extra) trailing space.
  *
  * SECTION: Variables/Built-in Variables
  */
diff --git a/test/unittest/builtinvar/tst.psinfo-bug22561297.d b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
index b9efd0ec..5a9fe333 100644
--- a/test/unittest/builtinvar/tst.psinfo-bug22561297.d
+++ b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values from profile.
+ * ASSERTION: To print psinfo structure values from profile.
  *
  * SECTION: Variables/Built-in Variables
  */
@@ -32,12 +30,14 @@ tick-10ms
 	printf("address of process = %p\n", curpsinfo->pr_addr);
 	printf("address of controlling tty = %p\n", curpsinfo->pr_ttydev);
 	printf("process name = %s\n", curpsinfo->pr_fname);
-	/* These are still getting faked */
 	printf("initial chars of arg list = %s\n", curpsinfo->pr_psargs);
 	printf("wait status for zombie = %d\n", curpsinfo->pr_wstat);
+/*
+ * These are not implemented yet.
 	printf("initial argument count = %d\n", curpsinfo->pr_argc);
 	printf("initial argument vector = %p\n", curpsinfo->pr_argv);
 	printf("initial environment vector = %p\n", curpsinfo->pr_envp);
+ */
 	printf("process data model = %d\n", curpsinfo->pr_dmodel);
 	printf("task id = %d\n", curpsinfo->pr_taskid);
 	printf("project id = %d\n", curpsinfo->pr_projid);
diff --git a/test/unittest/builtinvar/tst.psinfo.d b/test/unittest/builtinvar/tst.psinfo.d
index 92f91de7..09bcce86 100644
--- a/test/unittest/builtinvar/tst.psinfo.d
+++ b/test/unittest/builtinvar/tst.psinfo.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values from profile.
+ * ASSERTION: To print psinfo structure values from profile.
  *
  * SECTION: Variables/Built-in Variables
  */
@@ -31,12 +29,14 @@ tick-10ms
 	printf("address of process = %p\n", curpsinfo->pr_addr);
 	printf("address of controlling tty = %p\n", curpsinfo->pr_ttydev);
 	printf("process name = %s\n", curpsinfo->pr_fname);
-	/* These are still getting faked */
 	printf("initial chars of arg list = %s\n", curpsinfo->pr_psargs);
 	printf("wait status for zombie = %d\n", curpsinfo->pr_wstat);
+/*
+ * These are not implemented yet.
 	printf("initial argument count = %d\n", curpsinfo->pr_argc);
 	printf("initial argument vector = %p\n", curpsinfo->pr_argv);
 	printf("initial environment vector = %p\n", curpsinfo->pr_envp);
+ */
 	printf("process data model = %d\n", curpsinfo->pr_dmodel);
 	printf("task id = %d\n", curpsinfo->pr_taskid);
 	printf("project id = %d\n", curpsinfo->pr_projid);
diff --git a/test/unittest/builtinvar/tst.psinfo1.d b/test/unittest/builtinvar/tst.psinfo1.d
index 9e6d5053..be9e251c 100644
--- a/test/unittest/builtinvar/tst.psinfo1.d
+++ b/test/unittest/builtinvar/tst.psinfo1.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values.
+ * ASSERTION: To print psinfo structure values.
  *
  * SECTION: Variables/Built-in Variables
  */
@@ -29,12 +27,14 @@ BEGIN
 	printf("address of process = %p\n", curpsinfo->pr_addr);
 	printf("address of controlling tty = %p\n", curpsinfo->pr_ttydev);
 	printf("process name = %s\n", curpsinfo->pr_fname);
-	/* These are still getting faked */
 	printf("initial chars of arg list = %s\n", curpsinfo->pr_psargs);
 	printf("wait status for zombie = %d\n", curpsinfo->pr_wstat);
+/*
+ * These are not implemented yet.
 	printf("initial argument count = %d\n", curpsinfo->pr_argc);
 	printf("initial argument vector = %p\n", curpsinfo->pr_argv);
 	printf("initial environment vector = %p\n", curpsinfo->pr_envp);
+ */
 	printf("process data model = %d\n", curpsinfo->pr_dmodel);
 	printf("task id = %d\n", curpsinfo->pr_taskid);
 	printf("project id = %d\n", curpsinfo->pr_projid);
diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
new file mode 100644
index 00000000..5c4995ad
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: psinfo->pr_psargs provides correct results.
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+BEGIN
+{
+	mypid = pid;
+	system("/bin/echo TEST a b c ");
+}
+
+proc:::exec-success
+/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST a b c"/
+{
+	trace(curpsinfo->pr_psargs);
+	exit(0);
+}
+
+tick-1s
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
new file mode 100644
index 00000000..bbfe6074
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs.r
@@ -0,0 +1,2 @@
+TEST a b c
+/bin/echo TEST a b c
diff --git a/test/unittest/proc/tst.pr_psargs_other_task.d b/test/unittest/proc/tst.pr_psargs_other_task.d
new file mode 100644
index 00000000..040a7864
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs_other_task.d
@@ -0,0 +1,37 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: psinfo->pr_psargs is only implemented for curthread
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+BEGIN
+{
+	mypid = pid;
+	tsk = curthread;
+	system("/bin/echo TEST a b c ");
+}
+
+proc:::exec-success
+/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST a b c"/
+{
+	trace(xlate < psinfo_t > (tsk).pr_psargs);
+	exit(0);
+}
+
+tick-1s
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/proc/tst.pr_psargs_other_task.r b/test/unittest/proc/tst.pr_psargs_other_task.r
new file mode 100644
index 00000000..6e3f5ebf
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs_other_task.r
@@ -0,0 +1,2 @@
+TEST a b c
+<unknown>
diff --git a/test/unittest/variables/bvar/tst.execargs.d b/test/unittest/variables/bvar/tst.execargs.d
new file mode 100644
index 00000000..d4eac223
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.execargs.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'execargs' variable value can be retrieved.
+ *
+ * SECTION: Variables/Built-in Variables/execargs
+ */
+
+#pragma D option quiet
+
+BEGIN {
+	trace(execargs);
+	exit(0);
+}
+
+ERROR {
+	exit(1);
+}
-- 
2.45.2

