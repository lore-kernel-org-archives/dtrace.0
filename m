Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22236212A
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526671; cv=fail; b=C2XHhlmtTsxZGQjYe28kERNTrdmt7i8t9irYu81nL/ssVmrygrxkwxe0wBHutEfB2WxsNx7LpUak4jWrRjTmNkVgh6cm0USerIm0tL94gnbM1K3tDbyPLatKlWPZ3wh2IjJrjf6MkRXV4gUPhRrjOWJLe7viaLM80JIlA8EGspQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526671; c=relaxed/simple;
	bh=DKlY0qghzyW3buu+9VNyJ3n5scy0pxv8JpY/j7Fx4yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cuFdNb2+MeNKyoic5wEYX6rpw5qkAIR5MTOT36srF3aQmXM3mPfKtVRVuVcS1WafaOUgIwN9AFYevW6zUKi/vJaVMQK1MLpd4XSkmkFsIk5Kgjje75cTtmKYFE3aR3MvMqdR3oTAolLbP0fP2rUhROm6j8gyRkZFQ23uQHMfLr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GFk5TIN2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LjRXMeZQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GFk5TIN2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LjRXMeZQ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEb1Y455837
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=F43N1EbPbN8gylD5V8
	K7ZSBrRLDL5BXIRL+UUsJ+Jxo=; b=GFk5TIN2BaVnBmtnBrM466O9h8vAE6Jr4V
	Bz+N4sjwtmZfFIb8LcDBbWk6/HFUhUgK47QoLvdK4eyneRoIbcTaJkSiLrCBt+e3
	kJE2qmIP8oHFDagKT6qQcIUuxk5NvTSexnE6NG7r7iXO4kDlsYNU2lodzUXPSaNS
	rMML7NyvSUqk3hodeLhONcNNTUi/hxmsjTQRHr08yKUOKII3hDFA3F/1SzIKLq/C
	AJcOo0xj2ijfBTgC2n7SMHNFvblZPyJqd1X4KQQ0lbif9PgYCRpPUKs9im1G3sDP
	kG5KAyFBDNzTd5vl/1Hynmw9+pkdnoD0axs9njzDyVfHhkVk8q8w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvp4bv7cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:11:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60REVb7v001861
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:11:06 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhe2nws-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:11:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwI8nG8xumec69ZPr3JT3R/IKwu0nZQZ4V+kuNx0BG14VRA7ynMj2SURCPlmqFXh2FyLjjhY+YNReitekGlX/ni0ny84dUh/UeeO14ZodT8DYbm18OLvW1mWjyJUHXedFCrt0c4Yq4e7WXNREaKydz7C+KAzYn1NvtLo4u6HiJA/WaA2Ib0Gs4DPvWyO/sNaADQVX7FvVsjlgztn71B7x9PNTyO3v/4bvw2Fmo6VhdOdet5a4BLA7wOqjrKbPMawzVlGIMOes+5PVhHHIa7sIu2PnZ7pMkmwcEyYXBxyuZPmYXEeKDg9kDIEBNQUkFSYzxjk7UMj5GAJZ3E0tIohrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F43N1EbPbN8gylD5V8K7ZSBrRLDL5BXIRL+UUsJ+Jxo=;
 b=rZK2KJ8jFiIyMounrcbefhpARKRnC7dLz/gC5MFfdsGNHI+emJoNNdEo8BQ/OOapU2ggIIjcic0BZBLMsPmhySZqpANzefnrbK53ltKdgdR4gO42Xctva+/DZ5GNMwE/tDLtE1DmDpp2NAKHo8zCvVQru0PY6kSHnMaxdVtn2k21SQcHS1n8LF6CmjcD08k8LyAvPKvcr9gUvUUXJicRYARFh2pP5KUn22W6u/uS0UBwDDznJQ+yM3I/6JrV/JIdM/5Rp8+45mkOOQsADseA0NyGjaDYIoslcCbdTf41F0sKnqTAm+J1Mabpw9j5X5FfHbnBEq6MOpRgeJbEFHaVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F43N1EbPbN8gylD5V8K7ZSBrRLDL5BXIRL+UUsJ+Jxo=;
 b=LjRXMeZQvn0YgVS8ZGbPGsnkJhuoEaXpVYhxGGeC8KsmE/lulFjRwpPP9lpo7Btz+ZF9fIMNh63PTM9RYdyDPdurVBicLTois3DJEsrliKJ8Tgebea8BQeFX4jrt55S868zq1g5YFNzVXBdwIeOzW+ENTusjLc8AUwxN7xgPswA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS0PR10MB7175.namprd10.prod.outlook.com (2603:10b6:8:dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 15:11:03 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 15:11:03 +0000
Date: Tue, 27 Jan 2026 10:11:00 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Account for readahead tracepoints
Message-ID: <aXjVhMpPmlQivQZp@oracle.com>
References: <20260122072314.10617-1-eugene.loh@oracle.com>
 <87h5s72p17.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5s72p17.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS0PR10MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 56386e7c-8446-4fa9-9594-08de5db6493b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b/XER6eV4PeTSQaClxDy04viyF70TsnbvATXQ0A/Y2J2KQFz7q5T4IbovsYk?=
 =?us-ascii?Q?c2tg+4J3twGNwIa1/SAAeQuqd8FKBgrEn26wmGL2QLWa7fkGxArX5dlaje4z?=
 =?us-ascii?Q?gxNpAcmk2C5T2pwfFMRmufauvUYrR2EwiwqaQ2qgOy7o9CbbWMCpUjCgLyqy?=
 =?us-ascii?Q?G2ycA81+r7/ooJSfI/mBH7H83acaQK4Sivo7dJSV6jFTNjT0crHvIDrE2Rn3?=
 =?us-ascii?Q?NI8vWHIG2P0d1EgAyHWsyDYy5Y3B68fjf9uzx7D6xkpkHaTtUdo+0t8I4YUy?=
 =?us-ascii?Q?bPEBZE7DE2CHf+R3h/Erl/ELXU06ahYRMpfFjDye0v2K9zDePrmZTmnnlVPQ?=
 =?us-ascii?Q?UAJIoVfLROVaEmaIr3IYTvyW5abfnX2iYPyf9fS2d+6iPQKXl5Yx3INRq/5X?=
 =?us-ascii?Q?8dyEByR0P8foJknn8jL1A/kW94SU5W1UWg2CYVNj6lnH4B9mDcRh0lUNZxO8?=
 =?us-ascii?Q?jExZCV8Br5B8cZZoTFIbHwaXIAizdYyMsglKne1U2ljzb70RZltsg1Acg86B?=
 =?us-ascii?Q?G4LHp1C1LykTTbk3R4d2MTxDbAOFujJCNkLqleCfgjGV61fK4iFZYnh81mOA?=
 =?us-ascii?Q?jew4R6YyQRC9YfI6PlxnEeGSMFb6V+aA+V2Ev/REYQsddyYI5gko0BCMX4Z8?=
 =?us-ascii?Q?KNZuyA6xEIhyta2FmJG54zX1oBqQiOeb431Q/QZjReluOGXyH9JUfm03g1Im?=
 =?us-ascii?Q?aoa3cPx1i31CYXNNkBA+BP54KjV54dQfTQ86YuUTA3jKceX8H/iEh5cbrOCV?=
 =?us-ascii?Q?9Vb95LM3AUU8Qhs/vhvJDb1km7vUFXEn34BRIqY3K8UPgb1q7JT4+/l7qZEZ?=
 =?us-ascii?Q?bR5+hWkEpxNSx1BO7k32to6zxgBe7wivyf31JpUilbDtwzzmt9m5qnUk6d0f?=
 =?us-ascii?Q?mvNXfMSNw7t4EYmZU+uT4vaZhMcXlW+CNBQwOT8sAlmEKeBTbSiHGBGEsxON?=
 =?us-ascii?Q?IBAoEmOZN2RqjNhGSyj4pVGv2TM+6ZL6yXvjQv4hJbGT1OUDg9ZupjNo4Cfk?=
 =?us-ascii?Q?Kjsnqh8BjY2yKGgT/y0oDlR92I7BIzcjN/bKS4L2l7kEwCrKpGbYEOObkBOc?=
 =?us-ascii?Q?76GM5/DOkhUmogR4zv0sym3AHQw+lp1q3tsdT/LyKtj6bE8rBHeuL0Z7hnUU?=
 =?us-ascii?Q?ap4g0P4qSWBEWKF+DtM+gZesnakHox9NG3AbBUHom6no7gpKEc4LOavxPGAo?=
 =?us-ascii?Q?9vDQnUqsr0nl9xe3SNr6jJf8e9g+4FMBuN+7Cjd3DWFtPsOsN9MWzsY+tDQj?=
 =?us-ascii?Q?ePbEV6QqpydNeBZYM9DIh/NIDeKWQ+nVu9/nRjOJX66s54BsEA/tr9FIhVbf?=
 =?us-ascii?Q?eyD3RV83INkW3mFlSncUNE5JVHO/lChwgJj12sumJpMKzHPqQTlV+ONBJjnw?=
 =?us-ascii?Q?D6zdBFPNkDoVj3f+XNNR96siEmhkfUQYVxDvJ0ZWU8bpAA/XhBeyElHsLPB1?=
 =?us-ascii?Q?ik2Ip0N0JBRnzbThuJsQmg9pUbLRaO/iQELuF3AGle6yHe3gcDG4ClumOeDm?=
 =?us-ascii?Q?rKrENMYShAf7sZwTybrw24nk1GudgiKh0zVDfQ7yKGNRAHMiysd4a4Ls3xW8?=
 =?us-ascii?Q?I0pf301f3amh9V9Xbgw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dee8unXrTXLQV+NovF7ChNJVr0SZoMR/4Smb2F0c4N43tUZZ2yd0KsiBd0NQ?=
 =?us-ascii?Q?Pn5ZxjE1YSd5IDldTTVYFxH6WcWQVMa8lqEhCu70CodMhIxaWlgYlRCiyqKX?=
 =?us-ascii?Q?DY0ylY5aher9Jp7X34wutBrTseNZepDO8h5RKuUszYukACl6zYbbtiNoYbhu?=
 =?us-ascii?Q?/+xn8MiIDCw5Pqk+6YH5/uzL/1OrrWgi7Oy5cfprYvuqhcVhtAb+CzCQ9gzo?=
 =?us-ascii?Q?1KqO/V4RRSsvjWVMIb9lHjzpA4hjI69bG63GYzGTJoE7YMdBDk4C6eIBVtao?=
 =?us-ascii?Q?CJJX0mZTlqo0R5z/ZhBqyOKHojiqJQek22hBlaDsaTOV2RrkJ4tRSeNBDkmF?=
 =?us-ascii?Q?R9MbwHsw4aCbiCgNIxf9kxc5Vuc3BsTKuaTq3OKxbX6cVD5RfuVJe7UCyRGF?=
 =?us-ascii?Q?tUEfvsSQnBk5rXNmgodQVxpb67eKPBBeHihPfcwfT+5m6xN6pn9OEqlWFA9U?=
 =?us-ascii?Q?16oBQgrFe6Bz4ldCC4xVItrrgRWk5r9blKndG88gcel4OqK+DdBDHCT4zLJW?=
 =?us-ascii?Q?seoneiP6ByGMGjFGLRzqdbeB7mO8wsP1YAieKl57tfKGFHgfkRaHx39FJljU?=
 =?us-ascii?Q?BkPDg2b74hFBpq+ysSMmRrk/0Z9YOUQi6R2jns0b3LhyMfxOoXTjAPFfWGkL?=
 =?us-ascii?Q?R+BP4/Xs1XgnByb076q4dsaxYzzMGWNvZSSXF0ONlAlFrOkmVXaAChOs8WiN?=
 =?us-ascii?Q?hMazIgmTl6cC8Axow5ft4TUZTukJsnX/MdOStEZ1A1qkrTUHuKQi7I4uAgl/?=
 =?us-ascii?Q?egin9FpavpbWUZatsDZd0gda9AR0b9aHBe8WP/HuAOr4rwLw5IEaVnfhx55b?=
 =?us-ascii?Q?aG6ILGlHF5Hjl0JUe53ONP716ZnPl0Wo5xRtQbWM53HBU35KMHeHBaSFPW3B?=
 =?us-ascii?Q?5ZXZ86w7jZQ3sn3BOvGv1Q0H9WGuaU0GlI0IBnr/2M9SAY9BjKOPEXv8wVjc?=
 =?us-ascii?Q?qgaLACHVEQf7hlhxjz2JdQs44df5gjVv1V3/JRQkoUwz24uw/pAtet0HQ6j5?=
 =?us-ascii?Q?GfgXQ1EYKLyajcOp8lgycyi3TpECm1YtQP7RpXRgtU4lJP/5OvFlTbRHLbpM?=
 =?us-ascii?Q?2i+FnsXRhEVHTuPA5JgIpnW0UhsC14mOSXs1mcRxjNDxIQTZDX9qGAw9athJ?=
 =?us-ascii?Q?+hnkPYX4d78EZqRlkPVtGwirEXx2qUWMBkz7fAUIgJJDGyzA8VhiYCMJIdzr?=
 =?us-ascii?Q?waae6rRYeRDzyYihj2Trjcv0S1rPuoBHr+0AyuAvQ8AKAHyCKvXTZQPlA2wa?=
 =?us-ascii?Q?+KNZs2QS1RfZ6JZGlV6NVvEOj5ydYrl+Bk5lOAoc0JG6cFKbiEqE58VYGd9e?=
 =?us-ascii?Q?cNJ+irUb8vsDBR2fixuGUZt05dv9qSwhfCe6cpLTGNX1idMF4N1dvSpkk70Z?=
 =?us-ascii?Q?WE4ETt8Xq7pekWwHATnhCnBcF5EvWsUahiS9z4w/jLgR6x9u+qnRrE7JEwiX?=
 =?us-ascii?Q?It1fNfDd4jutecNjjf3kaC2oNXtMveGByzh++2zHRII6SWtsVa42EjvOWyox?=
 =?us-ascii?Q?ayE9nVyI1J3YD/MgpKWPx6Px4K5QdlVvKa6RNgfcF1qOz1BBl2wyXq5DxmUo?=
 =?us-ascii?Q?bl8SmGfWTplq4sxqQxQO31vnIBxpS/JUYRV2pY3PqeqK3BJL3kMAdo2A+us2?=
 =?us-ascii?Q?NPuf5yfcDh8ygmHslgv2f09DnJfxO/1UO6RzUHZ6vUMOYYa8f9s29trqbTlk?=
 =?us-ascii?Q?OTooNU4kRLgO3GRzvWi6uWDzmkGRE2ZtzF9bCTugmhHLoatwPe5XfHvM85G3?=
 =?us-ascii?Q?bx93VOnPwQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9VlpXsmUTwO3n2ptyJCYrVGr+6sXi0cm1BQaE4zAMoxuvRMLWS+gEN1n/xbTlqb1TDp4ynyHBPaKyGwelZoNN7J6usrAwcA2ZiFbr7A4tKf757QekhsFqQUrQ38w4z9txqY25X3AxeKpw7X4c0bU1sEtpYnuI76hliTyiSORuk5tauH1jJ0IHjLZ+q64KueJHd9tM5ESsRz+HUOFBpHJdE+wjxC/FxFap++9OyuIrbB45tbc9CwTl/Vx8OSqu3d9F9XLVm4Ps2Lc+R4X4qyFDxBAud9jFZqtZIZQiWKet14A8ucEHVVLo2FoSV/B/z2/phBQQ/NPcQu3+BTCYX3MCIOy7r0VXonRs+RgZUR6wJvhkQYI6s3pwfmq+2Hvspumoq8HmFYAAzHovSkPTmnsmCx+BWZJwUoSOG7QtvAXZEnF7pG6QUfDIcvuM775mzrogN6c4zbcqArDL5WM5PF2hHfQi7F5gy057ptb3PTT/bNnUM4j0qCt0gu57ModobLrXShqtBx9hMUltRG/4sZGsDgxkxOpS8kza1+M/7SpTt934tPGKb7X+pOme6pUjQeex08nyteYMbR9gSFff0QM7ru81uEW1Jh2Qj38KhcuS6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56386e7c-8446-4fa9-9594-08de5db6493b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:11:02.9281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iMv0qe5AvcZBW6xu09+Ztv5pcI8j0hY5Q0CvnprZhyaV1+0eAl/Y5Z98mFkRhWh/39t2FFzYVGkGfqIp0O3pua/Iix7QB25CxISaEwsx1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7175
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270124
X-Proofpoint-ORIG-GUID: XvPGVzlMfTb6QIl8FTOZhkHntTXSd71m
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=6978d58b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=xcKpIhjDmxZrZOwcCNsA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13644
X-Proofpoint-GUID: XvPGVzlMfTb6QIl8FTOZhkHntTXSd71m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNCBTYWx0ZWRfX67AXF+BNhNjL
 hMvVQ7xMdA/+IOMYCorHR7l4myzSfmM+0VmF4OpKO+CIylORoxjHLyPMGJKRWPP2OGVO3UVeS2n
 bzZ4JWTIG9igOpf/hzfJ65wnEU5Why33RjORALi1bPJsHN0MNnxoE7AQB+y8TTZa5qnpol5IC5G
 MCXtDx9k7skzkXiCMOBHCyjTPVx2z2d2gVS6HXoQEEirRh3qgGBmJrGg2xvfr3t/fLv/wIyZVnK
 g9wirUwz/F5PFNC+qCsoq2h2nOl+eqM0pixkFBe1Eu6omVTdy9x03sJPyxxDzUikXfX8nHJz3xG
 ndEFv+3ExzlercZz9iVPyST0gCmpYofrJRQcWapkXBm1S0pEt5cPcsyoyTdGJ6b7egYPqjz3BUx
 P//mUaVGyjf/n0DHNBQ7qFhve7DXzvDya+inr7awm0dQiWSHvLBxcD1SqQ2uzi/dSutqg3uc4pZ
 GKSunDo6HRs1KLAnO28sIVYE48CZtRiPHSpHgseo=

On Tue, Jan 27, 2026 at 12:55:32PM +0000, Nick Alcock wrote:
> On 22 Jan 2026, eugene loh uttered the following:
> 
> > From: Eugene Loh <eugene.loh@oracle.com>
> >
> > Some tests check for empty probe descriptions.  In some cases, the tests
> > relied on the absence of any read* modules.
> 
> Argh! Sorry, this was my bug way back when. I don't know why I thought
> this would work in the long term...
> 
> > However, some kernels can have "readahead" tracepoints.  Tests expecting
> > no read* modules will therefore fail.
> >
> > Change these tests to ask for readfoo* modules to ensure that the probe
> > descriptions will indeed find no probes.

But this commit message surely needs fixing because "read*" surely refers to
the tracepoint names and not to the module names.

> >
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> -- 
> NULL && (void)
