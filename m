Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB119D894
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 19:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812513; cv=fail; b=C4yXrGJFaRiHRpFqxBRIeGtHA//ySBB+5CmsGCabRX0IiAdBzr627FF5b74Jq44FpE+GbFDtL3mMbgrPd+B2qufqKD3W/9nYEVqQibimoB9se5zn9ipr/1gXWd7QsZ2QTk8DRYXAoSXAuj/RCmlZK7mzXjlUrg5kXk9qOmc1qic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812513; c=relaxed/simple;
	bh=J6y/rqRkXX+7psQDkh7L5ExrLFCLVP0U0DnI5RWELhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JH47IonSoCZxiKjVl/3mCWr63H6wKrf0QbEYyDPDwWpycHHOAGjJ7JDhQi18XBBbrLGGKRkIG1EddGj+Y48QZRbTK4AX418IVh7XRPbGRLLE042IT51QgWBp+bY3Al7KdVIFvUH8aj6vLUConW2KscC+KUwaB16TG6X9COs2m/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fFLqvZdf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tnKK/fdA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fFLqvZdf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tnKK/fdA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491IfdEC031122
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=vbXpaNsBTFVfvyXkxCVnwLYsOEry71TJfAgaOzufc8U=; b=
	fFLqvZdfCUT6zxR+ufRlfvgWZY2imKSRhoXyoNFHPWKERvV4YSr8MPHNeTUbRh/y
	5CBlaneKlbc3EB7LfNR4KBZFWvqSD9Br8tQzMKOl6L2I6QKjUlN3f4/7mpKLavEN
	f6UJiulPvZZZlwVGh+zA3zPXrR4xljlWrbceANwadCwjfLPirNOfhBHBO6MxmdUn
	SOtHQIAVc5QmAIRhTtzYEP+iU/cTb2uzdOdjKvj7YiW4Tt7SW11+yjbyrt4UKnMP
	lWJrTQXSZzvrDvhOPQoo4YCmA4zFI9VDVF8RkvTeSo23bkKQkesGvHKfRcuWpxS3
	el9SVYF3+HU/cupvAZl4GA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x9p9q49g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:55:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491If1Y5028642
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:55:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8888hp3-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IV3AbrehCUh1JvA+XUDNmZ08jfpUF4abDbnQDVoHtOGZSI8ob0TlgEHqRyeqReBBb8FURDxod+OyXOLU9BQOde8kBIGyAZVWAGw0I0nGrC3zJ2LOwQo0NEgsXT7X0nJ3vnDepIEz/eqXS75nOwYpAjGEdW1ujgiVhWuybTbVqTQg8a6ZXc3w8hrHtAjDhEgXGQQIevz/gTZGGUD4OW/dEr/GOuA+t2M8EbZtkrDIDimxYr2rSyZFT5lmBj3rZEsuGkcfkffKngRnIv47Km50Mfisf3yf33Sopvm4eL5iF1TCqe8Yby7uYanArUGZTbq/bcCs3t4KM7e0uljzaN0lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbXpaNsBTFVfvyXkxCVnwLYsOEry71TJfAgaOzufc8U=;
 b=dZ7YBs+em0QoloiZ7ukVu+DbMcmAdp9eociGx6gw9xJ23X/sNE/M0pOPW1AMqbgqobIwoWvN/KpM2mo/I/POsEQqrRaZvQkZXtzxlJXov15w+BXHuyu8g9XRaTaRzJNP/PGkYxPp5i0kAUiIs/djKqy7qEyHw2z7SEXp4i0ULTvyQ/P9tQ7rXj0w0Hft+/zxNk3AqdP3uhoiXVa7o6CsVRlzObqemVHb8++FM+acSLc8rm0h4NYSJAlCvB0QzUHpKWPOBgZRa5avyEjdtGhFhtgyfuuLNhcycdt21PGyFBlmZe7Wb3RHnLRylqD0/abN39TbvPs/a+6bfuEexaCpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbXpaNsBTFVfvyXkxCVnwLYsOEry71TJfAgaOzufc8U=;
 b=tnKK/fdAefKkXmgvFAkwo6fpCNVwRyW8I1QPINZwuGforMm37pC//fU8Kndz8Om9D7mK9CkIlHvdpcBSjksq9qWGyx51d//wnVzCs0cLG+FV8gCLRNYNFr9QUlPg7nfrgLHvm5HWPelHJ+nOxky2Qy+Vjrm2NU+Aw2Xy65isK2g=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by CH2PR10MB4133.namprd10.prod.outlook.com (2603:10b6:610:a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 19:55:05 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 19:55:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 2/2] ctf: work around binutils bug in ctf_link_add_cu_mapping()
Date: Tue,  1 Oct 2024 20:54:52 +0100
Message-ID: <20241001195452.223321-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241001195452.223321-1-nick.alcock@oracle.com>
References: <20241001195452.223321-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|CH2PR10MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e14a7f-7ad9-41bf-d072-08dce252f1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Yqz8zB9uEBHw+TeYTKP1vhVcjoMagm8CUDraz/6zE8pyRGxpZ6hkXPn8v3C?=
 =?us-ascii?Q?APC7wePYyahBAasV+bg68NXUkSrO7eiWS2dCu9wmYjlU72GGUe1vqddjfaQd?=
 =?us-ascii?Q?mkph0R/0TkRktpZM9GLYxRDkjtWf1T/vgMY1hs7sameyMASDscJjpqmAW/xD?=
 =?us-ascii?Q?E7/2wAWD4nzzmn/0OKf5zbtqPVVBuqFFuNAKeosiZpAtKsBml1bHFrIeu6Gn?=
 =?us-ascii?Q?v0b6w6M1LSkvFX/eEyOkmBoYjNTuUnm4e43n+MzA/SYbDRGNfuaWDB4zSmyQ?=
 =?us-ascii?Q?kgDx1spU+PF4sihWhU4d8p9ZaIyvChhzdEnlfK0v+3COqCZWlGjB8c3a7JkK?=
 =?us-ascii?Q?o4YWCa53AgfEOZd72yCm0rbFt07l8qCG1E5hlc+gLf1uExfpuWAf517p4pt6?=
 =?us-ascii?Q?GtrLG/65vr9dDFv7+skXHfDU2vYpPDgPOl5ZDHhbz+TWqq/9kKogrAEEZJc5?=
 =?us-ascii?Q?DUqK9PWq2wqqRxLLyOIqIrjkgg0YWRyQrd/58wknQVFwaQaT+hiyQXKfzfhM?=
 =?us-ascii?Q?yB4QkP12vvCWcxx4SVA4Zr2yyK1/aC6XeKpc1wBvINAkRrfpZNhUCAkTYp2z?=
 =?us-ascii?Q?55rbpIaU0Mbr1TWM2IVPDhn/5C3wDporgf4JcOB8TmGBXqVwGBL4M9sQ6SEm?=
 =?us-ascii?Q?ikgFtDqjclcsQ0VYUJv9Lr/aj3U486KiPoCRQD52OZ39gCgjHvrl4Am6WGAG?=
 =?us-ascii?Q?c7wnerTmMxk+E4Bhod6I5iiFR/8p2Jj86PvVRZkXRQ/ZRdaWdnXSb1OoBwVX?=
 =?us-ascii?Q?Qk8mpYARoy9H0nesOeKlg5NtyrdmBrkYaAqKCqIO4TcFHMnbXRbx6uqvrI1f?=
 =?us-ascii?Q?I2WQuW13U9B1c7Lw1vqazA1adMwDjVfuyU3VddpXwHTDPzMufDe38KkRXWhn?=
 =?us-ascii?Q?pkVAJWthmtvvGDH0L51EdgJwCXsv37tPMOwT7uQFDCwPIB/AdDUMyQGV3lc5?=
 =?us-ascii?Q?fX4pZiuK/4JhLrWLnCze8SZkstVDzJtUrFEjcdlHU9WEFglChFXTylpWMbN+?=
 =?us-ascii?Q?vDcUBlacCgdyx/MNrQoIBSn6iY+YbUbpbeZgaymBNKWL0P0E9OWnAew7CWAt?=
 =?us-ascii?Q?lL0gDfuLLkZErSQI8uzRFNq7xJ9Wj28MIGhnkFaE8zKha4yRD+e8cUwpPJ90?=
 =?us-ascii?Q?jgjmpgDlFAKmYyonKnl6iDnw9RChDIyl9WJR6Kcc5TEjQMIBUVd2iZ8LVBgb?=
 =?us-ascii?Q?hIbaxqyx6Sz+Tgc08pj5znDraWZF2uWylmTRBBpYFBex6mNTvzXb51vDZXt3?=
 =?us-ascii?Q?ouLSvOsippe7Hv9fk2HUMxoA1vqfoIJoG0xlpgDtEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4LbuMKcJKu6ZmI2fhJ9u5mqhgQVhqEQOiErpDQUK5A/vQrbQzFObQ6IcYWPm?=
 =?us-ascii?Q?5q7fV+bPG6k7G25ig/trF641X6q9PgzB6O7L1gKea96RNqvvMPm6uDDdXxS2?=
 =?us-ascii?Q?ZJcs2PStgquBMG6qf5a6hwwHOXmdt+D9YzY4cHDMAyLhQg57madCNrfy6y8F?=
 =?us-ascii?Q?w/40s/LUAVWGQrVk2GniV2dUn4WyK2G5KpE9vVr54z6T1dYr+PuPLZb+7vDm?=
 =?us-ascii?Q?7kz6agQX/ePu166BJStTjkdLi0/jknhX7ic6L3uWLmrqBJBmu91JM34Sq0/i?=
 =?us-ascii?Q?q965wsOG8IXQR8/b0SqTP6iRCKzKcghP2fJkcaL82KMQhZvzfPt+D79rmUvc?=
 =?us-ascii?Q?V7xPIXEKS4snPjrRHLTt6eLghw04uGVTkTGVgIdf0vO2By1UEtoZOpkT9nIm?=
 =?us-ascii?Q?40Q5MuLK1YtYNTIhXXTYUa5VBnG7fRm8jJwIr7oI6/RdLnnNrCNwGc2mKkSl?=
 =?us-ascii?Q?VXLjTpllBKsZe1Jdt/kqzyI5AgY0s+Vh1xlCEU0l7XbSK0mAEFQt0wmAntmr?=
 =?us-ascii?Q?VUmL3IIihPFrx6Gf2TpbBdSX14ogCr8ew6j6GUAOLDaHeUuNQmW67BfrnEdc?=
 =?us-ascii?Q?m2KRLXSdhxPYAMZ/W1FHGxkKhlzeLZxGlpkDzi4PC9cubb+eFTVkSi40ha8Y?=
 =?us-ascii?Q?G1NKjUNy0OP2rIAkuma/0a+6ST2OOSf5Min9DARG5Ghwv2BZ7n7dE2+hO873?=
 =?us-ascii?Q?fb2K0Je6tXW9ya8+KVb93rPOm1MrogMJ5LxxutDbgcMaxCkNtT06PHd/lnnr?=
 =?us-ascii?Q?vojajgqHzBraWs+xlyjcQzk7X+PEdX1BwMtnHN45mZCzZaK3S8HSXB/Z2NP6?=
 =?us-ascii?Q?/e5kutSfEqWdx6ijCW/t3V4tJd9BRwyMlbV+Gt859HDNcHDxvceRP187JTDL?=
 =?us-ascii?Q?WZVsLa5CxM1Fsxa3V2zhaGo604igdFATsaj4H43SiIA7HmmiSPF1a9YE86SJ?=
 =?us-ascii?Q?a0pEHRB10PrzyQ81y0nIvpC6eKH6uhGo4JYh8Ie/t1bSUwVaEl1dzYCbNz5r?=
 =?us-ascii?Q?w2p/Oj7Ss3G423HDEKoZ39RoXjpeKNQBTEQyryFre/WUA/tKpM1suYvElTVP?=
 =?us-ascii?Q?lkfWF09AbWq0PWpDqVvWrcID5xQcrKmgriOdLka3xjimVc8A9rylljbQs4bL?=
 =?us-ascii?Q?E6LQb277fiPlZZSBsFQswTfIE8WjbQa6GZUX3Ah3X7qOb3Z9VZ98zKdA/Kdo?=
 =?us-ascii?Q?hB6hc3ekooUas+CbiZqD30saekPyujq/1qCJ4a0+/blIJr63N0KRddTbC4se?=
 =?us-ascii?Q?nrpVOxDVV/MgePchKtrHeK0lytmEWyvpaQGoynDEsfEw6/dzZ/C4qtQVA8ot?=
 =?us-ascii?Q?xiv6ywne5A5RQHkALsCa779DXr3ryG7n69Jxf+4ArrCHR3w6OdqQOFEqxujg?=
 =?us-ascii?Q?Zj+y4Umu7R7HRXtWkyiotUcMcRLLEZFvXSt5LsFMJnCZxqD1gZdcThW5IuNA?=
 =?us-ascii?Q?Mj/IFytFhj4/AUsZy1ZHdvCNQ7AsyWHDv2Q7LpWgsfKhExTy73w9O0hwQI3r?=
 =?us-ascii?Q?+mejjnjsLbbZ/oCcOqxmA6z5l9pUZeeDh4OYGSP91iN/RxYIkLJMYsIjzMDl?=
 =?us-ascii?Q?bKD7utiHPXxPSBkyuLhjIBo8gXVDwayiWZAabxQAF3g/M9/79DSCm77Vbeu4?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ATYyNukqxeYHUAjc49AEwmqFd1WMsDmRtEtfNBluQ1SA7bHN5/F4EtjNrzR+kER3UwhkX/vcYY7nbjkHxqQ4mNWDdv3WCIaIHoizEJ4oEMVAIGVlZM3tXpO6TH4gduA//sKSYwBJF94D0W30BcWx+vdQD4ckSjp18bTTE5PeakqIpUMf7ubwW2kUZVQXLsizSNqRukHq5rNNPvTeL/Q0yMPZdEECmZ0qalAcryzeYTlvrJYtffFa2MSbR/HIDxb8DN8dQsUNJPGbtjaFYxFs6+gPps7jWrMCPvwWFyPQui88BLJPPQJq1k3OtRgzcfqODmZbNVGxUsaY0ipDOdMxEa2AFuMZ0QFnlBUFAmjX1pfQ0Xr/j375QAcTD83cF6elybkIzDHAXaGBrGSGleGqlFeXYDikswtn8UbXNBtUQd9N5ZvGD3MNICHVFGdo+wtXOkxPM3c3mQ5wH8YmSZYwY0J5dstx/VOSZZwi6bd7GGFYJDNGLhBZzW0kh9UiUIw1dkb/ZnPi+QV0BDdF0D+j9GqeDVNmOVI9NYy7OnjV6FILYgCvD3Sr7N1hAkyrnkUD5MDHqS/kio2VjAx6J8k4Ax76gecyiA9IoiylqQcsaRw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e14a7f-7ad9-41bf-d072-08dce252f1c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:55:05.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOdY99AYA253aHyLjSHb5AGY6Bp1ByGfoLLrmju+rdQYhvgiM3yzI3mthRV7pFX0eLJzRBJSlmOxy2WKbkdBCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4133
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2410010130
X-Proofpoint-ORIG-GUID: r6ErzZWa7H12bMq5Ec3E_TuOCwaGcLYO
X-Proofpoint-GUID: r6ErzZWa7H12bMq5Ec3E_TuOCwaGcLYO

All binutilses to date have a bug in ctf_link_add_cu_mapping(), which we use
to cause multi-object-file modules (including the core vmlinux itself) to be
represented as one great big child CTF dict rather than one dict per
translation unit.  The idea is that you can call it repeatedly with
different object file -> child dict name mappings, and the last with a given
object file name takes precedence: but instead inconsistent and unhelpful
things happen, and usually the net effect is to end up with most built-in
modules empty, and their contents emptied into vmlinux instead.

Fix this by adding a crude hash table to ctfarchive which accumulates calls
to ctf_link_add_cu_mapping() and keeps only the last one seen for any given
FROM.

The fact that we need to *implement* a hash table means that this adds
almost a third to the total bulk of ctfarchive.c, none of which would be
necessary if we could rely on a fixed binutils.  But we won't be able to do
that for a while...

Orabug: 29891866
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
 scripts/ctf/ctfarchive.c | 106 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 102 insertions(+), 4 deletions(-)

diff --git a/scripts/ctf/ctfarchive.c b/scripts/ctf/ctfarchive.c
index a852856ee676..eac15b5b707b 100644
--- a/scripts/ctf/ctfarchive.c
+++ b/scripts/ctf/ctfarchive.c
@@ -47,6 +47,100 @@ static void add_to_link(const char *fn)
 	}
 }
 
+struct from_to
+{
+	char *from;
+	char *to;
+};
+
+/*
+ * The world's stupidest hash table of FROM -> TO.
+ */
+static struct from_to **from_tos[256];
+static size_t alloc_from_tos[256];
+static size_t num_from_tos[256];
+
+static unsigned char from_to_hash(const char *from)
+{
+	unsigned char hval = 0;
+
+	const char *p;
+	for (p = from; *p; p++)
+		hval += *p;
+
+	return hval;
+}
+
+/*
+ * Note that we will need to add a CU mapping later on.
+ *
+ * Present purely to work around a binutils bug that stops
+ * ctf_link_add_cu_mapping() working right when called repeatedly
+ * with the same FROM.
+ */
+static int add_cu_mapping(const char *from, const char *to)
+{
+	ssize_t i, j;
+
+	i = from_to_hash(from);
+
+	for (j = 0; j < num_from_tos[i]; j++)
+		if (strcmp(from, from_tos[i][j]->from) == 0) {
+			char *tmp;
+
+			free(from_tos[i][j]->to);
+			tmp = strdup(to);
+			if (!tmp)
+				goto oom;
+			from_tos[i][j]->to = tmp;
+			return 0;
+		    }
+
+	if (num_from_tos[i] >= alloc_from_tos[i]) {
+		struct from_to **tmp;
+		if (alloc_from_tos[i] < 16)
+			alloc_from_tos[i] = 16;
+		else
+			alloc_from_tos[i] *= 2;
+
+		tmp = realloc(from_tos[i], alloc_from_tos[i] * sizeof(struct from_to *));
+		if (!tmp)
+			goto oom;
+
+		from_tos[i] = tmp;
+	}
+
+	j = num_from_tos[i];
+	from_tos[i][j] = malloc(sizeof(struct from_to));
+	if (from_tos[i][j] == NULL)
+		goto oom;
+	from_tos[i][j]->from = strdup(from);
+	from_tos[i][j]->to = strdup(to);
+	if (!from_tos[i][j]->from || !from_tos[i][j]->to)
+		goto oom;
+	num_from_tos[i]++;
+
+	return 0;
+  oom:
+	fprintf(stderr,
+		"out of memory in add_cu_mapping\n");
+	exit(1);
+}
+
+/*
+ * Finally tell binutils to add all the CU mappings, with duplicate FROMs
+ * replaced with the most recent one.
+ */
+static void commit_cu_mappings(void)
+{
+	ssize_t i, j;
+
+	for (i = 0; i < 256; i++)
+		for (j = 0; j < num_from_tos[i]; j++)
+			ctf_link_add_cu_mapping(output, from_tos[i][j]->from,
+						from_tos[i][j]->to);
+}
+
 /*
  * Add a CU mapping to the link.
  *
@@ -88,7 +182,7 @@ static void add_cu_mappings(const char *fn)
 
 		n -= strlen(".ko.ctf");
 		mod = strndup(modname, n);
-		ctf_link_add_cu_mapping(output, fn, mod);
+		add_cu_mapping(fn, mod);
 		free(mod);
 	}
 	free(dynmodname);
@@ -99,7 +193,7 @@ static void add_cu_mappings(const char *fn)
  */
 static void add_builtins(const char *fn)
 {
-	if (ctf_link_add_cu_mapping(output, fn, "vmlinux") < 0)
+	if (add_cu_mapping(fn, "vmlinux") < 0)
 	{
 		fprintf(stderr, "Cannot add CTF CU mapping from %s to \"vmlinux\"\n",
 			ctf_errmsg(ctf_errno(output)));
@@ -164,8 +258,7 @@ static void suck_in_modules(const char *module_objnames_name)
 		size_t j;
 
 		for (j = 0; paths[j] != NULL; j++) {
-			if (ctf_link_add_cu_mapping(output, paths[j],
-						    module_name) < 0) {
+			if (add_cu_mapping(paths[j], module_name) < 0) {
 				fprintf(stderr, "Cannot add path -> module mapping for "
 					"%s -> %s: %s\n", paths[j], module_name,
 					ctf_errmsg(ctf_errno(output)));
@@ -248,6 +341,11 @@ int main(int argc, char *argv[])
 	 */
 	suck_in_modules(argv[3]);
 
+	/*
+	 * Commit the added CU mappings.
+	 */
+	commit_cu_mappings();
+
 	/*
 	 * Arrange to fix up the module names.
 	 */
-- 
2.46.0.278.g36e3a12567

