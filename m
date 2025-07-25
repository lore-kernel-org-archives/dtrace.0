Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4E41BF58
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451036; cv=fail; b=Pb01HFVylQvuXnE80zfQC6Z5Vy7ebYbkU61aGMeph+Y4hM0OGz1zDAoxWJPpIJ5ERrT16TVYFgE/+SYspWOsXTxKiweCyL7NKD8WH6/LnxeiuCFc3ARGAh3ykNGNCjRCMMVdBUe8rqNxCv8qB3UW7TDGLl3j9Up6GkGioPYiloE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451036; c=relaxed/simple;
	bh=dtRPcP/x3aywSbF6rbCHN9bGNZlPv8zrsdYM+qyGqEE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=pqOIX2zCgzUwP0+3d1DqLM2HzXXUe0EZBWl3/8YGO1sLbB4jNbbKLNOKNDutkSStm3LGIciTWMUdRwJBNlr33q1b+J/tjCsw9PxDTrmFrrY28QS2dG2c3JwVV/EbXq3rwZNm0VAZ74SclsOMEPQ7y6Y0oF5pIVrviK6+jiM4RYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=db9Pq7Z1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ck9V3Ju2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="db9Pq7Z1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ck9V3Ju2"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PDfslK023043
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 13:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Z57NUOcguMLBpO7KKq
	7aKfbIHHFiiw74KK5iNAK+Evo=; b=db9Pq7Z1tHx5QRVIoHEFQddpHJUB5rU7va
	StfIQFjQIKCdNke++o2hlvlcrBLxEiFYoqeJIZ1xx07rPSrmFYKfxO3aFLbGD6DA
	iPXbiagLesP0Wgci9rDuB16UFuyeSIdCOPYRcxVHGuDwul941LuIQs61Vwa094vh
	JbmaJi73Ox2CdUpiU3M+30pLlKx568xgfbpA/u+e88a5s3tNgBd+Rnt/yYSOk57L
	vHnYDxijzas1H0s4zsRosAMJHxE/cwLOxKY/yYcu/ykjeRZe39m+KoNz2uh+SJbV
	EB+V2bI3or0IUsM0XLlDBvBgMYaqhPbOo1A2yOsc2ZxyWEND36FA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1k138v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 13:43:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PCa9ZG005740
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 13:43:53 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801td33hw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 13:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVfQlMbX+O+823oMYXkbpD5MSTwtOi6KjKChIbW0SNQFVUnK7MvCCBXnhVmLM6Lqv2wp9NeFCdQoMvoOAh25HS8KEOvA0s4rOftzZxnOfEyFDSG/bCwbyl+l6SOSLAtKb0uKnz5MJ5eQuxWRiLX1wPhP3ny8So71itcM5yXPw8L9l764NwktRaiQl2pgumGICmGHMfehlpEdSYSod9ILaDPF6UJpeZsAg+OJeMN+gLTK8o0FxMFKXb0XRpuwI7MmLHgwk9EmB660S2QvfhC25W+05InmqJXZQwe1lUfU7mxZqkUe3dFUdoY1qm9PQsAVEN4KxR+dQ6MSedO5k9wmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z57NUOcguMLBpO7KKq7aKfbIHHFiiw74KK5iNAK+Evo=;
 b=eAsh8AawNtkdLbEEgNCKs70PNUmo9YiyT1SY4F6lpgZigWhyNFeA2YxnpKZZr3RY0R+Rov4F9ctgnCbugQ+VrOLKQN+ZJ/75+8T92dJbyJhF9inuolHNA05K2kKVs4YYevyYDqwFYzeCT3NjSQzLYHcVFKFOH4ISPP+G/SXQHq0SX+FDTj6+8MTY9C5Xrj3K+FcyqbaIxGJ3T41isG3boEIUR/tMCnaXlr5Uhpq07srMgyZEZwMMLiFMuWvylpAkLvUpff1RpwE41eEWhFad3t1rea2+9zhaHOM5TJk1MKprq5aBYJC2gIA4j6mUDdC2mVHoYIqph6lJPP1SX4Guzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z57NUOcguMLBpO7KKq7aKfbIHHFiiw74KK5iNAK+Evo=;
 b=Ck9V3Ju2ROgigByaz8su7ATpxVefGT7srVwI//9fKai4i7ThjWmjZdnRrXJOYovL1sjZ8hAjTgvlSVTORJkBGNNQZgsiNEgZiDIcD3iOdtBD7zromrxVUPsN3VioAgoJMwKJ4Xm+lRtAph9hUa2Sn2Alq7SJWpEENXQRtLQ1BWg=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA3PR10MB8019.namprd10.prod.outlook.com
 (2603:10b6:208:513::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 13:43:50 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 13:43:49 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] install: add installation of libdtrace
 header file to install target
References: <SJ0PR10MB56726AD8147AC2395763967AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: it's all fun and games, until somebody tries to edit a file.
Date: Fri, 25 Jul 2025 14:43:44 +0100
In-Reply-To: <SJ0PR10MB56726AD8147AC2395763967AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Fri, 25 Jul 2025
	00:02:06 -0400")
Message-ID: <87tt305qsv.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA3PR10MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fc7f83-df5f-49f7-2fb4-08ddcb814916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/k9Cfj8m+GXNBrSCryc7xv5iVbcGjdPlVM0UpyKpOLiHdzut8Wb6YjcvIlrf?=
 =?us-ascii?Q?ii+JnB6iTfd20QFTuqMnnFQyH1uqvrfKI60fNWZ8APT6zmHPo6nwiL6XPPQk?=
 =?us-ascii?Q?en1jlTGVn7/PEPWWjwlA+Glfwe3m5VexJs3lAsxELej7GgNxByVSsUa2X8oM?=
 =?us-ascii?Q?adE0XrE0URA4sfwRTC+WSPxleLOQD57oqjYcY6mfOndMet3qGjbXobuNO2Nu?=
 =?us-ascii?Q?8dohEkl+gQMLhC+ijlloPip+ObEHMbu/HxHK8OSpR7IaZJUqXc3mUG0jFkdy?=
 =?us-ascii?Q?cNv/0BylYn/TUiD/YIGM8oDm/2zDFtZk2m6Ez7XW3kmbblm56t4uyfJoYhrZ?=
 =?us-ascii?Q?Pfj9zgqwHa5rMnttKrHsokYHuaZa2quN34a4SKckEXyfiaJ+v3jmIBRhRLRg?=
 =?us-ascii?Q?dkXShcA9oFdfk0wVnHg+G71CvN5mDt2uWdt4KB8MvwNJrJrwW/CwD0YxvzwV?=
 =?us-ascii?Q?qXs4TRB6FRESGNhltqOl4mxNO4s5zFzhjgGmieP9kRTGz11byBYxGlGFM1RX?=
 =?us-ascii?Q?zLeEvkiXBjNZ+irpP/SNeI1fN+F726MJuE7tQNiVigaU6CZhULSDtFNudTyg?=
 =?us-ascii?Q?eJPFCKRLmFFW3GQFwX0Ceu+HHf3yADLenV2loRix9MZM5BfN5hNsbIHgG/Ds?=
 =?us-ascii?Q?APEy0R2iOYnXatwOHQK11JsB5U1lUKGKFYxJKV0DwBu2tRzBnEIVTuAwxr8i?=
 =?us-ascii?Q?NhdlLHpfYL4ddZWoBwNTHO3R4RCX/l6ehA7/sarJ+qYVOyQHQh0PofIH+zFl?=
 =?us-ascii?Q?K/UhVRt5IfhQgcQ6IL2xqQ3flpgUc24VDGp42sSrufYBzvZPMemFXTjadO3L?=
 =?us-ascii?Q?JqWyH8Qj8z30Oz625iwrvzS6Cjupya40W10yAL2Z3zs9+J//3+44owkyzX7e?=
 =?us-ascii?Q?Dj/P/tvi7b9EqcM9Nciy+fy64nGz4pxVjRcfHxksEFWPrzaxDzs/4+q8y2PK?=
 =?us-ascii?Q?YGDNgsNO5y1gkCqSmQpSMX2JL0q+4OAUG3pYv2yXXoLrgItBVSgiQwEmqTZ3?=
 =?us-ascii?Q?kYuYDy+/UhiIcfPFKZE/eg9Kk9CDE1AVfuIYk/C82IekPLwWRxf1pAXSHylU?=
 =?us-ascii?Q?ffVUsCm5GwDznFucyk8s1kDM18JdXkr/vZKeYgP4nBJDq1SvaExD+zSJ3N1C?=
 =?us-ascii?Q?zx1mMnTpVw5lzqIuol988l2hqxYHA34Vln+6LcM8IoKBj8CdOMk1QFLXS4J2?=
 =?us-ascii?Q?uoYzoz9WnhSvIRCkruej3GnPqSmz2xb5M0XJnpo6+/KtBT8oUVlpiGJlPMwp?=
 =?us-ascii?Q?CGM2CgwZ6cb/VrLVm4TvoFS3IP2qQfXI4XgiaJ2PWLuxOgUWqGXcJAgvc0dX?=
 =?us-ascii?Q?EArCJ7sfbKeapq7bvsMVzh62J3o7hDco2UgbreJqMPKziumfNYvTVnI/1sl7?=
 =?us-ascii?Q?eNHzRH2f3gC7u0Rs5NgAPOJwal86+edueeLK4C0YmyShVmlJ6dXOENev9g6N?=
 =?us-ascii?Q?rENKlSY9ylg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f5DJPA/hydalrzonMeLD57J0WKBtvbMy/fC35YHqhS9RSTBbSc8MKgm3GhmL?=
 =?us-ascii?Q?R3duFTofgxMMmgsmIywVczevZvyOhxIiDsdEBPbLE4Lkp8OaLYcT1myj+a58?=
 =?us-ascii?Q?A0Lt1tr3M8zXiIueZOVbQ+TN3JaEt5hoictOO/2AOG7efmY7Gme2pPq8sMbH?=
 =?us-ascii?Q?k+GMe5Zy7NsDral+KaaCSxZ5LXMwdrTrMTiMl/oiti8Sg9Az9jG6WEi48sMl?=
 =?us-ascii?Q?wOCkkuxCxRdfUAQYJcZ+ANxDdsJOYZpLKBZQoooWdElwmyGLh6uD65wsAx3D?=
 =?us-ascii?Q?VNK9gOUcvuXKReiDEx6SiVzn1SDKOI0VrzITXwcOULiio7NBUOOqyLXQgct0?=
 =?us-ascii?Q?FIorlkHmxE0ayG1cMMzT7nyHJ3u38m4kbvGgzk4pJRXiPJTsUqqmaJZaqZCx?=
 =?us-ascii?Q?1O7RWY7UuC92njxE4c1jvBYyFFpk1X/roZ3ehMh/r2pd81Y+gkdoVaA43iQI?=
 =?us-ascii?Q?7eoqPF4jGKMX/amyAWEhpapcEd6P1IgU8m9u3O6+WUEm0A/RJWcyV1UzEIWU?=
 =?us-ascii?Q?Gh0vM7Gx3WSOi2dfbeOqG2TeTQbBoOOZsaIpj9TaHaeHRpp2zaNTQoeuhQdT?=
 =?us-ascii?Q?/3cizbYrkK74xXLYfG/QuuNEMDCBuU3aoPjGRJV8oCwDWMCOkyD6xnH5H3mr?=
 =?us-ascii?Q?7G0vDde9u54NotuQt6HHJfly6go4t2LAau9cQm6/dlKk0nRDH29ytkqcOvGO?=
 =?us-ascii?Q?kqUhEpS71vUZDQ4pn+/4xq+pOVRJ91S6emO+pnjW1WdpO0H5YNrhiCkjkhGk?=
 =?us-ascii?Q?Ah1zZrtV8MYrnloGMdPIoL0XPV/iD5dohz/Zp7VsYbgN0GzBViylrDsrqEJv?=
 =?us-ascii?Q?iRFxLr+ls+vAYF07OvKwYSTM5C8a8/C/xxOU7DURIx3N8n40EQa2lfPjFyrg?=
 =?us-ascii?Q?4LEJf/92XDpj8yhbu0b4CyDWbi9MS9xFtJtYMs9WS4PhVZt7ZzjPrYB3H5Dw?=
 =?us-ascii?Q?6vQNGcTue1d6zJWHgNmE+V3A9UpL1/lxkJoc83Vt9mNnwwS3YrBgC/ew3stG?=
 =?us-ascii?Q?pvoiu2uRORo6aoCmsc/1P/wz6/hV69fdYE2IvzfXZD9cVOPNYVYRxRnkGFN/?=
 =?us-ascii?Q?N2BxP1h9hGf2jYlcSQDdGDLqjfgHbbwq55eCQqI6qail3MfJ4Wj1aYTVrVVv?=
 =?us-ascii?Q?4orYt+TOSOI/ISPGDHqdFaEYb3fF7Wvz8Xb8f4A7AkUVbl4GIINVrzGqrhOI?=
 =?us-ascii?Q?LU9oZ1Ql5hWgYUCdDNs0a7sVk4mbfWqkhHo68O2iR5m5UbPCi2rOBZyGKEZ8?=
 =?us-ascii?Q?2LfNv1tyHMJMQz8hroB2IX8ZACiiB0VxZVUnZqDhTCkMpjYLxij1BgXOEBDx?=
 =?us-ascii?Q?dcAtjDkTJsnOjJIDzYvihaUIjM/79z3H2MVbHwjFg6iBppHacgIcyxCGVpdl?=
 =?us-ascii?Q?Y5UXpDjn5enbJnRDRvnc50yiMYgbHI9T4ilN2Ca1I3ybxMb9hKbEofyp5djW?=
 =?us-ascii?Q?3077jVG/MJ2bn0zNvVBnpXAPo7hoPa+78MCSnDU/vpeCwkbWEGIfGSjU+XR9?=
 =?us-ascii?Q?mWnKU2OKSBsgDh+xPIuhh6+HnQbgr/hQl5rETUFxX5g+8hX3MCtph3vR8OtZ?=
 =?us-ascii?Q?jXlrkjOdR/uyyssT89L0mu0MJwSlNXfDctnNImxbBYEB0ZDnJ5s0mPMHS+D8?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VL4K/0aC9ivVtssOmJ3WDx82pyOneMLgIlOh0LcgSpnnKZ2oudv5cArTUb137TbR8lGqGF8Dy1dyGz6fq7wo16Gxr0/rGDL/VQaXHKLBHqaSEXdbSzP4K+uoyZfshhtV6zt4Ygaic3km486OLEcjl+cPCi+I/mYSblD+vxH+5ij8JpPh8CiH891+n5Bpn6B9F8JPNrpaDdY9izGzKAMBgtLCyd9RLEKZy7FF+Y4IbjuMHHGNS1zTQbKzgXvmWeJuZI2Y17otlpY+4j5ZDmjgnCdGiLxxjA6hclXiX00iUOdI/a3jD48MzBqxjz/DY2gqVIvvPTrI5yEqhVR0QgMwStdXNm9eCylaswLKQ1mXy7R9s5Oy0hEit0f0hnZhOFTW4Kwkp0A9bcjpZB0vm7iF6pna2WsXec/BTJjozqCOs8qIqJfEr2Ut5fZXtEid3IKXIJOhyjFiQnKED4yZSnqqcb/f1YP1OqSaW0mxa4ftB0/22qRrDMzsjitkuuTtbikIcx6H2GRW2LVMWfvYbhJP7QH1uFBsuRXVzLADlokHQ380Z+5A+5rJkqZAkT1GnAlage81x6I0G61Yu/XqDBGYM7e18uCFoNqJLojXMfVRXPM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fc7f83-df5f-49f7-2fb4-08ddcb814916
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:43:49.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEogHqfFSC37tz4RoNK0pLOhU4kUGAQpK356R5Se96+3QmevOz6WuPJ2XCPi3fpKdl87B7b6/53Z+1GJP8RPPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250117
X-Proofpoint-GUID: IPmcoplXOO-6hWO-pVSDPvlqaUYiYDfv
X-Authority-Analysis: v=2.4 cv=LYE86ifi c=1 sm=1 tr=0 ts=68838a1a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=zvcan2TUMi3w1zWaaF8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDExNyBTYWx0ZWRfX1bQ6XXBqlXZI
 sru4ZG3hv+EVbVuxEsv+iKFeXEOOmWNWqCM0VFPK1/xN7/H6spi6TdRrOpRBo3ktKXX8PL0zbBh
 WJkvEmvOjkAbl+WbWB2H7WCmQOM5kFre9at/TUqXi2i2o/nW15H8ohMwjnpiy6/TH68U7pzyZp1
 awjKFlLTqVViUp50u8uhVA2jniNuLvMt7QPE0Z+3lczC5QFs+jPLcqAeawT9/oLbU+E8MwXag85
 SbdX4VsMx67DAJkNaCaoSpTERlf1K52dFWKWcKYQtywgNKa5KqbxQI/x2bOuC8m77cRYei60NAU
 uG6TcJzYHqoP7WJfWByvq53g7zMQiMmGHgo4hZr2r4+f6SsZbeI+f+zPxyPmeyfBwFw01ELshvK
 pXSpxlYaoZqLJsQuuIQbiy0WSMIGF32nuooWpi9RHfmMXMuaPZUVs/2vE5xvEPUjcS6EuEQL
X-Proofpoint-ORIG-GUID: IPmcoplXOO-6hWO-pVSDPvlqaUYiYDfv

On 25 Jul 2025, Kris Van Hees via DTrace-devel uttered the following:

> Commit 35989b43 ("spec: ensure the include/dtrace hierarchy is included
> in dtrace-devel") assumed that the include/dtrace hierarchy was actually
> installed with 'make install' but that is incorrect.
>
> Now it is.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  include/Build | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/Build b/include/Build
> index 84cf11c0..706e1ed5 100644
> --- a/include/Build
> +++ b/include/Build
> @@ -5,8 +5,17 @@
>  
>  dt_include_DIR := $(current-dir)
>  
> +# Header files that are needed for consumer development.
> +
> +DTRACE_HEADERS_INSTALL := $(notdir $(wildcard $(dt_include_DIR)/dtrace/*.h))
> +
>  $(objdir)/dt_git_version.h: $(dt_include_DIR)/dt_git_version.h.in .git-version
>  	sed 's,@GIT-VERSION@,'"`cat .git-version`", < $(dt_include_DIR)/dt_git_version.h.in > $(objdir)/dt_git_version.h
>  
>  $(objdir)/include/bpf_asm_helpers.h: /usr/include/bpf/bpf_helper_defs.h $(objdir)/include/.dir.stamp
>  	./include/mkHelpers $< > $@
> +
> +install::
> +	mkdir -p $(INSTINCLUDEDIR)/dtrace
> +	$(call describe-install-target,$(INSTINCLUDEDIR)/dtrace,$(notdir $(DTRACE_HEADERS_INSTALL)))
> +	cd $(dt_include_DIR)/dtrace && install -m 644 $(DTRACE_HEADERS_INSTALL) $(INSTINCLUDEDIR)/dtrace

LGTM (though if we add more dirs, we might want to move away from
stripping the dirname off only to add it back on).

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
