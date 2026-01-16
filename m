Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247B23183B
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604262; cv=fail; b=ujTR5ks2xdTok/QTsU5Y9mvsi+Ow7eN/NtjiTEXwMqCK4Fw8fldL7Pg1rfmRUu/SQ+8MjOUVTAGRU473mydbUdXIjHdVG2sZignv9JqgXw49acKC+17h7icdnYBDTob4s9f9syHKzEklyY4t4VCpls2wTWIqwHg/q8Yeqyiy9rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604262; c=relaxed/simple;
	bh=DRtAq8AQ3IXsWcNFUq9ZAbqUqTxOEcXAz1U+3AKsgBk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oty+qa0bbf1IG2q7UDvDfJx6aEejGqvkHHgUpp88H9b4IeHdiP0fhm37ROj3mnjwhacYKmskWTvF76SGj4SUU4GV6InBvPkXb8Ol5rDWNlFI9ZxBl/oB7T7Tk6sjpwmfOYOn7+ZUp11RzaF/aOnh9VAUUvG+Xvdnz+moWo0T0ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IiL8VG7S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i60NKCnD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IiL8VG7S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i60NKCnD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKWGRe3528447
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=01UhkaWCewezbxwn/jSQ/XDOP443XKgW8KpssbAROAw=; b=
	IiL8VG7StbgMu7PNhcg4kulyG78c2R7OfKnA5gJ6ea6QZ2ymNq51aC3YiZ379G0h
	nBh75I/W1gNcvA1ejrM6A65Qe2WAB9/HY4eaejG3oKodN7k4NKZDj1n6fcgbRIyx
	6xmMQj+PTG6D+k61eMDhGOAEMt/UjPpZPu49Or5aBpxcOfvenTsS1y3FDSzd+H4d
	pbOpQe/OyE3aNKO9i07L4EEmv862QcVajFJAAIntFxt9sYvMcCiv2kN2uJ3hnyBz
	pOqn1mRAZuKSg+53NMYT+HcEflAwhAL4kk85AMr1RVQXJ3cc4K/h+9vKplEV5+ax
	T5ZJa06hPirpTYuf7rGzOg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvf005hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:57:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GMsqcr011450
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:57:39 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv9m4cch-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:57:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De8LuArk3Tm/2LGCXEidJnU06RWDUEVU97Od47TkIh4Bds488x/II5HTG9MHp2nzt0i4SiwDjby646QIdNAHo3Enc1q4WVsG32qQ/v0067RC1bOwpwyG+NYoaTFZ5nLn4v+LfLvom2BX9uezywgfD/RmyEYDbCIz5yMbYwlYxia8i6JMUAh0+Vcy0G3BbQ73RNv1Gwi6D/fJF8Vb50xQz8mKB89ik9CaJ1gfxj9FSTjtEC/vvfeJNuro6XO2f91XUzH1EHz/O/Zygrz1wrTd1PnzSeZJphpsY6chWL8RsnY9v1J5tcCg/4tlw4Pk0oOIyiWpENzc1/crUEfvsioCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01UhkaWCewezbxwn/jSQ/XDOP443XKgW8KpssbAROAw=;
 b=I42HovGnDj2iwiH54wCSIUKlw/n2ZKJGG/jWvGmoKpAu9QwNVzH3VYRy6GYsSDcJDN3IaOcEkCTo4oPD1Wwi1nKXaMc9yljbVDt5FORSaBDeJwMJ7gZNriV46tEJRtspcE/DgP2lS8ChhsBNyrHDmTaFRyxWoj8CehZKeqFQFNyuAIGOn6l013X5aaSlwgbF9ek4d0oq5zfUXCv+4plNB9OLfMexsDzVs+MCs17VhXGRf9fAyY2yVMmNsp+dIPWjW9M1SxpM1P1xMG7LTfHQPpiZhtL8h8RjcOxiY64AE8Bzm2rHFA1UqpxbwFdYxN4k651e88hsXIOU6TsNCUx9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01UhkaWCewezbxwn/jSQ/XDOP443XKgW8KpssbAROAw=;
 b=i60NKCnD1/HtaCOXlh63e2TK1iOttoW6d7REJKCfWOn3zqwQ9xbs7KDd3W6ODWRSZjolzKjC58sV9U5E1oxsKS9oGiFPDI+o0jnjDrv4XK6gA50LMwbc9Hmn+N+Rlb3wLSOEzXKvB3qJry0qM4IEInfMYAoEr4Tq/8ogTejJPug=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7701.namprd10.prod.outlook.com (2603:10b6:610:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 22:57:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 22:57:36 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] Use asprintf() to allocate strings
Date: Fri, 16 Jan 2026 17:57:34 -0500
Message-Id: <20260116225734.23447-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef6182a-0f3f-41bf-78e1-08de5552a44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZM0GKjgVAi76w4paLx2h+E1GwLNjdqiIs2lgicSfoGKY+syIzCzwW+vYFXq?=
 =?us-ascii?Q?6EtvKMgpQBskGaFOmqMijwBeaBFiRwm1nOcVW6ALpZMCYkbmBcRykhhpHkHY?=
 =?us-ascii?Q?zZKx+qfaBrKca3iOt2y+VISwTyrCXOwoHqJf//11ydRnysLFj7+Y1ITxvMSm?=
 =?us-ascii?Q?rV3lj8O2Akiq3SKQ2Ohxkdi6AYzCfS4L4+djwlc6hnquN6TWnOAjg8TpEyyM?=
 =?us-ascii?Q?21sAa6/W6pl0dNAu3GfOo4H/mj56i2TqBq6ChBrzyc7i1oGFJaEvWSiEu8FE?=
 =?us-ascii?Q?rZzuabaprtttS5POoFa3WJe5AKRp11h78vze/mJDWONJGon/8AjTo3gW1QIl?=
 =?us-ascii?Q?h016TeG+gJQNsI2qb2O2Qe1FGXDaTMBh0ws1ltWLEibaN+KIQaA4rv0JN1Y+?=
 =?us-ascii?Q?H+ozN9JGWgRoJ4u6qXK0hrbhalkCsPkDJp33r/8YhC78w8xRO3JNHgiXG3PW?=
 =?us-ascii?Q?66ss7ljTbEOOEI86dHKzB0hGY7JJVoap6YDQLUWYh1VhRxq5IEmHysXUEC+Z?=
 =?us-ascii?Q?zTQMODNKw6c92vbjWlw1QvtKH+vj2uEyB83qYWfArCArG2d5oiqdQqgnl7Ek?=
 =?us-ascii?Q?miHOEm8qBxX1TJY2rxlNo/N+GhU3/rEbXRkREJzdkTjII+uNKwwdZVh5DYAN?=
 =?us-ascii?Q?iuJq7sStKwiA12Q0VruEBS9+L9SDG6Btc7vfUK3iTsAbbUG9Oji8FY6d7EBa?=
 =?us-ascii?Q?PzxY7Dj9VNXQUstJS48zpipxqM4oAF9a/qg6ypS1reriX5LT4r9dowvrBzU8?=
 =?us-ascii?Q?mX9lbPhTbh/bHSumlO9bGoSwCNLtUXbMUv15HMfe6sGHRR5tQ+sQwLuNQkdP?=
 =?us-ascii?Q?L5XAdNAs9d82w3TnnmUpfkr+8KgV54Ysm6r4WtpkZf+8RxUBo1o0qX0RUGsw?=
 =?us-ascii?Q?FU1bSRxwqFrGjZf7uXNRCY24rXHwOauZs8u/5ZgFEdlEJrT5tay6+ogqRTCX?=
 =?us-ascii?Q?IKZP/Nus4OGTVuMUxBxaQ+KbigFTQeLe6p4MSh6iGr7lewWDA2kRK1eBaDKj?=
 =?us-ascii?Q?eMi//tScwXHD3naWGY6tPthMdQtsOdG7ZON/wJrJhQ5MdQecoaVZGX8f+HV0?=
 =?us-ascii?Q?JoNZ5D+GijKAjtezxHROjFNf4qRcsDWq/MglxM/Cx3qzjAlj8Jg+d/yrdEf+?=
 =?us-ascii?Q?sML+szaaY3gxHjFSRbGTJwFUhkf3wJpx3cl8HlQwuNljvWw0MygzpSasX1x8?=
 =?us-ascii?Q?Vhvuy5RBgx3tqtw3IAxCb9iJW1gS6Ni7vdSLAVTVVFiM+lAbYX892JKJAQiE?=
 =?us-ascii?Q?5IH0nkE+IE4+vMOyB94iuPyivUPwUiH2mN0SAphcez0bGsdg2gy6sve/ORnf?=
 =?us-ascii?Q?t0O8sHs798Y1sqDEL97NPxc0p3jRaO58IzdcuwXFm5kMWzjuFokTfyTVkwix?=
 =?us-ascii?Q?UokhtePZWmMGl8CanOD+pqYkai6RaJWrG7HfZ9Gdj6WgSIczhsUfys6q6T1A?=
 =?us-ascii?Q?3NQGxg4OsO8Q70S5aw9zTckivVwrU/JdtqK9Kr5YFz4qeIj7FysO5heB/JNd?=
 =?us-ascii?Q?3W0vhAJq+oo+rQ57aAHlPFcioFUul6A3PGTwcLUJakntLKtfIocq14lT/S4V?=
 =?us-ascii?Q?RynsRNANoc0bPLhIhZueU8fcdHKtOH2Kt8xXZAGx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g1Pr1S7JmZynovKn8Aw5T4cXVWE99CrWdBqQ3aZBfdohTjsdjWX+ZgniTVuo?=
 =?us-ascii?Q?kCAjUpLD3kc7ocW/JgA3DubherbNKKvUN4TBC0eKTH7dl5QxxJkNrvdF0SLx?=
 =?us-ascii?Q?2v5SLqNj3wmwWnFUKJR6UyTt9wIAwcAx8F+y7e4nzgepgRkxxWjFn4EwiPCn?=
 =?us-ascii?Q?uiPa2Zljecb0qupnLlETZIpVS6V4bhr+SetIWYAJasoBFYddt1HB4m0l5zKt?=
 =?us-ascii?Q?fakxy0uMIu+Z3li6S0zqe7jBiKCKTGQ5nnQ2plNiFKKYqHS3eJdmJCO5P85C?=
 =?us-ascii?Q?bTmyaIr9rkasMJPTZ2SiQW2oxkuoP9edHF7IFmGqG2rZeScTaFsMwxq2ccS4?=
 =?us-ascii?Q?VPrg4Isky2lhAElIS50SNu4HUIFcJwyezLyu6/IxNtw1FE124vd+0ufql6OR?=
 =?us-ascii?Q?XfFzxi5kw7Zqx3L3CF/vGp8fJw/NrgoIOEXiml0M2VW2mLDTBVjdz78cxFSU?=
 =?us-ascii?Q?eLagHT4us5yRHZJyadjEhLRcLarW5kiRvbpJx2aQb899YvRUW8DHBgVKlJXB?=
 =?us-ascii?Q?penKdplxIWjIPKvIlAf6WzzJ1Yk4+E5V+abjl8A1rpfRpU+Q26exacDD/A/D?=
 =?us-ascii?Q?yfWJ53uIMgP1EV0jkdsa3KeQIhSAt1v/LBw3At2MisvjcBC1rSRfJ4+7uBRu?=
 =?us-ascii?Q?LLszCiXUDJyLxxaWSkQ5+bZQDHeM7lnchdZnO1WZj448Oc915WIF57TDrvtr?=
 =?us-ascii?Q?7ZXmjkcMEdYq3rUcOJohjybUWQ74FdNwYKmgG0bcZFSW4cxDYGOM5CEZUWYN?=
 =?us-ascii?Q?cuaFIVF2KCjKl676i/v3XbUv8KAo5EhQDS2OgtO2SGtH4IfwlohjQfGrKkfi?=
 =?us-ascii?Q?5nFVDJBdhlXiTjxivmMvc5grTajx+ERvz6DxveUGMotI1ofqD7SbEYI6RlAq?=
 =?us-ascii?Q?tzT7Z8QK4dNH8RMrbzwJnOHp2xgiT4dVkNfSZWWDcv4TKpwWRf6yNA9fJ7K3?=
 =?us-ascii?Q?5EXDVYODMTqjXd5f1Gl5wu5JNuhweFKw1w0/rGBOmwt7XA+m1PLFBZnU9qTh?=
 =?us-ascii?Q?dBcOp8Q377hzy9cgGCfJHyWwIBPlvkZDpLsbbDBOl7trFrnvKoeedgAXBbMx?=
 =?us-ascii?Q?b+a0ILdTuqoTi1Yblp0ayNdOKcE8WPpzJachelOsEJLrELAgM1sWXRhYcZeF?=
 =?us-ascii?Q?nszvldITTz88dNvwACHD/OgO+kj43bSWxRph7/bAbGEO/v1ZPsqLTIYxftg1?=
 =?us-ascii?Q?o02xGYcSbWqAdYjPf4A6SDT2WsTNXQE9lYCBXtTnO8cC8lUd6ePxnIqQtsQs?=
 =?us-ascii?Q?fF4Aty74h+cc3bUVFrGUEwq63fa5TSE0h1e/fOpbQRUUaPosY8/EMD0r+Tgy?=
 =?us-ascii?Q?Pu6fk4OAgiVc1DxFniI+i1sVIX5/KFO6QDxZdi7aBto9IbENtgOQYMRIHqZm?=
 =?us-ascii?Q?ySmR0CShCz3zb44DuF673c/Z9uXL7LO8yUv1H4JkiJqzFxKgJETA3kGJNSmJ?=
 =?us-ascii?Q?9rYjwWKVz2TCWH6BCwN7ZzYHZQpPP52rDzRJVjwdaVW+S1Z41Hu/+ay5SLrV?=
 =?us-ascii?Q?LN9CQW+YYgNMdPydefxkDsU0W2nEz/jemPDN9LdluG3P61QHMVPchqdHW13f?=
 =?us-ascii?Q?aR/noAEAUYuzuHe8ngF7Bs4urQa6hOjdwZbYMva5Xi4ULtnOLNlytt/OSESP?=
 =?us-ascii?Q?uPREYnPbS+IOoCHkea1vOkQhNmrdNhoAKyH5rJBDHjdbUwsB6rdl9DJIh3W0?=
 =?us-ascii?Q?64UThM3SCofJF76aR8v5UoLzznr8fs8tzk7QBmKR8zpOcYxmpmIokw7il1SS?=
 =?us-ascii?Q?byEfF681yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mkwlsByuZpti+evqQCaBHQmmxqJcePTqUmjA1Kh6mkDDFo9SMf6ssVfItEpF4HeM4qanfRxsFft+bhsdGvmfAIIuGKiAaBqqVFXLyaEVoe/Ej5vAGDaGb5SAq+q0ZnRTadyI2ock42sMrXj+Zn6jEDtAVhGbTHY5X9rISHGo6+Oyp+/t7TnKqjpNUF6SkybqnLT38V8ZwYT19UKb4Qon3F4jt2SgqHzpNseOVR0oa/45/REC0zNY7RGtgIyZsjrG7dxfeWx3Kg5px/nsqXOk9eE5wmtMY4oGMh2Ok8kS/MJV0h5Gfa2Ene3FLIiR/k7hlFp3UnaOWgyo9bB2tbVXcqkyp7WYBpN96YGr180iS1YBwqMFytckG+H79iTGo2QXO720nPtTzlKqgvEMmpdBkDBCPLCtro3X1ecn3hUx+qJV3sYOi7uRuruZreOR9zEHNgyneAUY6FrUcWv4AazhXlh20P/Ecrp/FPxbIcqd04IrCBFbpZBFjSuPBKr/aR1T0ERSJD4VUHwMjkmW/XJHUuAh+fCApottsMLmDTIWbLw+N6UJRs8hcJUfONUtIhQsQTfCwWQY+yli9tqYTynUKUE+SO/PE5BWlXr3OUwEwSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef6182a-0f3f-41bf-78e1-08de5552a44b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:57:36.6418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NDFhs/jUGwfRhxbCxqBukJMkd+D6yYydJTS/GwSWURRgFVmwPFhpSYhyd8trjNzW+sVLcqAOmv3Z/uZnIMgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7701
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160172
X-Authority-Analysis: v=2.4 cv=AJKKJ3lP c=1 sm=1 tr=0 ts=696ac263 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=lVFsP0LyvDe2ofc61JcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3MyBTYWx0ZWRfX8MsDhJho5a7X
 nU47GSYeKDu2os8bYJQNXEU3cisoXGBYxJubiZWaKrxHxksomF2rkT33gWYkb880jlRfHV16Q3K
 1ITutE0NLbigFqAJPMvFy1t0rL2a6b6nQOnAF9iN+eWNnO7pemLU6SHAeADB8OGM29JQf3U4mve
 mBjyFeDREeLmFuKj8W7y312szLdo93K0wxr/UUt+VQ+IdjFDJntGYwcJeTEBPFG6cnZhlsalwVI
 hzbkScMozSG9agMTCFBkUajfB0Vu1e34N67MYwU8pAC8yAJFmpbfE4Et4dwumoQwzeU8loMnOBA
 FMHdCqvNsPhOG+c7m13g2OGwQEqDLSo8345kePuMKzlq6/8s0uyDYR1xVu3db7mvusbIgFiHl+I
 iE0J0nquJkzmJmn0zXOSZZ4BBwD2pDl/tyTRc5LRJDmhBUrPAXPDX/xIuraF1aGvugtY8RTJDPO
 SMMU1cwxS6u5XYEvjDA==
X-Proofpoint-ORIG-GUID: 59bE4T2BsR4sR19iw7efmUAwDkz4MF0g
X-Proofpoint-GUID: 59bE4T2BsR4sR19iw7efmUAwDkz4MF0g

From: Eugene Loh <eugene.loh@oracle.com>

Earlier patches have slowly replaced constructs like:
    int len;
    len = snprintf(NULL, 0, format, args) + 1;
    buf = malloc(len);
    snprintf(buf, len, format, args);
with the more compact:
    asprintf(&buf, format, args);

Replace the remaining instances of the bulkier construct.

Note that dt_conf_init() continues to compute a buffer length and
allocate a buffer, since that buffer will be reused multiple times.

Further, dt_probe_tag() keeps its current form so that memory can be
allocated with alloca() to guard against memory leaks in the event that
ctf_add_typedef() fails.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_link.c        | 17 +++++++----------
 libdtrace/dt_prov_dtrace.c | 12 +++---------
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index c9e0ea5fe..ffa16d9a4 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -416,7 +416,6 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	char drti[PATH_MAX], symvers[PATH_MAX];
 	int fd, i, cur;
 	char *cmd;
-	size_t len;
 	int ret = 0, status = 0;
 
 	/*
@@ -426,6 +425,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	 */
 	if (pgp == NULL) {
 		const char *fmt = "%s -o %s -r";
+		size_t len;
 
 		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, file) + 1;
 
@@ -521,15 +521,12 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 		}
 		snprintf(symvers, sizeof (symvers), "%s/drti/drti-vers", libdir->dir_path);
 
-		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, emu, file,
-			       symvers, fd, drti) + 1;
+		asprintf(&cmd, fmt, dtp->dt_ld_path, emu, file, symvers, fd,
+			 drti);
+		status = system(cmd);
+		free(cmd);
 
-		cmd = alloca(len);
-
-		(void) snprintf(cmd, len, fmt, dtp->dt_ld_path, emu, file,
-				symvers, fd, drti);
-
-		if ((status = system(cmd)) == -1) {
+		if (status == -1) {
 			ret = dt_link_error(dtp, NULL, -1,
 			    "failed to run %s: %s", dtp->dt_ld_path,
 			    strerror(errno));
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 1bd405b81..9ef001a33 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -228,7 +228,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		char	*spec;
 		char	*fn;
 		FILE	*f;
-		size_t	len;
 		int	fd, rc = -1;
 
 		/* get a uprobe specification for this probe */
@@ -248,16 +247,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
-		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
-			       EVENTSFS, PROBE_DATA) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		if (asprintf(&fn, "%s" PROBE_FMT "/format", EVENTSFS,
+			     PROBE_DATA) < 0)
 			return -ENOENT;
-
-		snprintf(fn, len, "%s" PROBE_FMT "/format",
-			 EVENTSFS, PROBE_DATA);
 		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		free(fn);
 		if (f == NULL)
 			return -ENOENT;
 
-- 
2.47.3

