Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2A1401B
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454352; cv=fail; b=QFR6jna7gViDSXGexdm/yCYtSKULpk1V9EOWUwGm1pn9NOlrGL8SiqH6XUHB+lA/MYDo0JBZrAXqxtvvCJWcvOXApcL/SqEL16Fm8dvE5vq3/ceapL96vZlcvWQUlwCUrHfcEmnV+tJOWqbZ12UGxTFHtMIN4TZKSYfIkzKBTO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454352; c=relaxed/simple;
	bh=eHxksT+8sL1numHqnQbizdycUw/ywWNDBX3wYzUc4uU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=qpwKqSjO5iAOrthrXORmB6WQPQubnAQ1+42h5JFLRPhpk5lXcXwScsYMD+k83+zOcNE+/Jpjtly5utLsN2bdJVvrjLOP061h4HpJsL3TMAUjZU+UEDdGLBpC9ERka6ZT7fuRVVuBMywxeVyHyjscB/KPwN2VEuBWvpx0ocDEPss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YdRbfv5V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fCXL+mmr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YdRbfv5V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fCXL+mmr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHu9GJ027188
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=QWkq2wYd36QndS
	1hb9rghdnN/WyqFP013LegBoUbk6A=; b=YdRbfv5VXcM96/u1UlKhKhzUV6WjF3
	nlIIcEcx9vO6QpcTuNKWjT+9mM6EcHfWb9BqGdHWiHpVT0dHl4p63xXDU0pWRtjs
	Hz1G6MpuJWDyqQmuBiGLR8O9plzKXWbIRfcEAn/t15u+jWX1FjdoxQN34Hkc3yOS
	n8pNC/meofAoddsTgyrDXYuZSdmaGCbvGvbMcd+KcnxNAffIyagrEcjY+29GU1oy
	36yXSAqrCiOtwpMA8/vU44AGh0DOLJXayEE/7b7ae2jxhg8Dhl/e1h2FWwcp0YVO
	kAZif2/MGR4Ff5V0aM/5Jl9GIQQemHo2k9660L/zlm2QfdaWMOypUSjA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgs875c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:32:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VHiWwh035581
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:32:28 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvny6hsk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJT1BpsIS1lNr1F4/622OYMfdGzNI/hS5wu84/BHboTpRcNgE18rAspyrDC1gYccJjCbO7DSCyzYlXa2yuNDsagW9nqQwY3jrBB0/dIIWE6HbBWo23O8FL5xStYH/8lIoImHr1k2A9/HVD/Nd8CzHZycKb8T4iEVN/NfLkQY+jAfGTE3aW9jEMmtraLs86tMKZ0j+h79pabty/TLIvChMW5NrK/uBRKMc/Hcp6XRzU4hderTb9DwQ7YyEjyPaQ80cSgND+uDnfxwA22JExOYvkUWRfvgtg8f0FXPXyS+eX8AO037ZhJ04NfoYBNIoa8ZR0ps1nAdVQfS/4gXlx6dlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWkq2wYd36QndS1hb9rghdnN/WyqFP013LegBoUbk6A=;
 b=FmJpjnfZbsXOF2G+41EHyLU7mk/smirdzji06yc4ESP14sfO5IfsWWpLOoi+r+bSCGVRSlyBJkpcGbTOTIwdSLwuuOk196zGWWxifsS5O3SI3ISKTWguUKUn6JmFNrlqsGxxi0c7zHcM9KWbIppUHtUrlwIuHaZj80U2qkfryRrIocB65baCeAKEwssvdO8kO1N1vuwMAAcfVT8/gjAR8filwsX2Y5pFwKc4Z1/uNK4+yRgg/SHij3khQbawSI83IlgBb1Z5g948hilK+S7HC3HxZYop0vzUVGrwZrOfZHdST27dg/XbNZpdwnq72f4Q7BWJN1Yxb9da513EGjmpow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWkq2wYd36QndS1hb9rghdnN/WyqFP013LegBoUbk6A=;
 b=fCXL+mmrwoXmLBds8fZA+O1cxOyiDlt4hdoagm/J3VjYoh9OsngGq/1VgEr9SmsfY9SnMvIlZKiLRvBRB4691IymtnGWctyCqq8r6/9bgWMokNowDvFmAlMPj0m0NtOUMRvTQkkp9QSRQ7FnfbYF63AIDyomXeHwJjF1K7pvGqA=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7090.namprd10.prod.outlook.com (2603:10b6:8:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 19:32:26 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 19:32:26 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 7/9] tests: delete the kernel build dir
 stuff
References: <20240531185928.363245-1-nick.alcock@oracle.com>
	<20240531185928.363245-8-nick.alcock@oracle.com>
	<ZqqPC/p6DiTdcmse@oracle.com>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Wed, 31 Jul 2024 20:32:19 +0100
In-Reply-To: <ZqqPC/p6DiTdcmse@oracle.com> (Kris Van Hees's message of "Wed,
	31 Jul 2024 15:22:51 -0400")
Message-ID: <87ed79mk70.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0638.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::18) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2c44bf-0fc7-4a1c-3714-08dcb19781f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HyT+aexB6t5zzCDFH3j9posnBQqfCoAKDW5kAX2VuCYPCCdEI9x+xjbIh1zQ?=
 =?us-ascii?Q?iBjzl6g6FVoL8qoCHS4hZE4TVebLIgKhi8+q5QgLfkYCxDQxUW+0kAhzpUtZ?=
 =?us-ascii?Q?iHVF2f7oEkDcxwHN75w3FvDTNjtdrp6dZ3s0htl+mXxldWKTljudtKNHdvbi?=
 =?us-ascii?Q?PKg+HVcM4wwQeEOql9VDTHxeCnbsiUxhPHiYGbML1Zva/dYLgFC/0jlDflGC?=
 =?us-ascii?Q?HoJJ5YFpYhsWFDB4nrkZM+qs/IEdVq7C9fpwqovBzmvSPksw8rE7zcZrK7dJ?=
 =?us-ascii?Q?O5FZpeDrW7ptgDuWwQ27+NEpcCZQ2VRMvdx9Vhopq77aGARmMwQN33Iua800?=
 =?us-ascii?Q?UUhQFT7WDL8nBHsDMeFAvgbdLemVMur+nCx7o+WtXhRMds0hH1g3Pdu4miJC?=
 =?us-ascii?Q?qDppjx0aQckCZlhmb8O4ZHj58uBJVf2jRHRDBbNIPlVjaDId37F4X89S0bxb?=
 =?us-ascii?Q?zHDtAWEN2Qp0pAHjac3qUQWr/GJy3oFoNwnTjXomlt04dzX79axB4FGwxjSR?=
 =?us-ascii?Q?Ox0/JQIaoyrMkLKtoc/E48udbHWnPQft6kubcAnYAlk2usWId+38Nc2eaj2w?=
 =?us-ascii?Q?N5AcMRt0CTx55db9VGz29XnFDV/1wu5axPNY4c/XZcTKdnw98fjETy5LLzhD?=
 =?us-ascii?Q?01wja44uZrMrMR2pdT8qEMNCsaIaoA9trX3xx84t3I1sEIWcnYtbboN0AK/F?=
 =?us-ascii?Q?6gDl5O6SOCH1DT3buoMee6zaM859r5HrA6NGI5voyfAV5MSIcijHmeWJwsM1?=
 =?us-ascii?Q?9fwFpd9E527yCGLajkYYpLmNJlUXvZzSBrxbFfOVtw8tuDJ2lEoswjyU1UH5?=
 =?us-ascii?Q?DDyz+iNlD3/Zs472Jur3uKoKztVGt+XgLXsjAKxCzafTWkYytJJ5prtAjid7?=
 =?us-ascii?Q?SB5AnUHhuMf4HHLUUefF12JqleWdXTi2Iiw+8PEKQwuNrpzOJd60lIAJTLd/?=
 =?us-ascii?Q?/SJM+IqnKnawaBc0/YBxQGS2DhX8bkn9+zfFva7RouKD5L15ijExPjDx28rV?=
 =?us-ascii?Q?CDEwuDJwTAjfwA8BjQkFbkqAkKXGJHsV3itcDMDoGhfWhIpVT32h6d4XkmkB?=
 =?us-ascii?Q?f0feT2T0SKT6i/9h0rinaxxc89uCjUMtLqsCCCxbeCJkbYdwrGyWaAJq4VZu?=
 =?us-ascii?Q?JCR1RGbXN+YcVRcwmTTFBZlTwJgXNjUoS92lN8f2XiFQhwyCtq3BUi5HJaaH?=
 =?us-ascii?Q?uA5+fKy6dGUD2ZCd2gUMe/18suZeCbsl8YW7byjPnZ9nfXsWIHN4NolyDcer?=
 =?us-ascii?Q?uox/42lYQk07rKpY7xAj5PCMZC0dJ4BiqZ5e1S4oD01vou6KgdbDZDQlFe8n?=
 =?us-ascii?Q?uyPiwDZ5Zd0l5L62uY+svSj4xsMAY2PcsDcFh+Vx0n5XkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9APQDXijbdwMwLNZJRTS1JBq9RRaTa+gTX1jtE0N2w+ZUsBJEGOJoNYERRB?=
 =?us-ascii?Q?eqWv5zeCaGFsGdduHn9dEKZQ3VvbMyVWC67X/BFQqtXZldrSY+UeK6KIUoHg?=
 =?us-ascii?Q?dzLxb5a+0saXlWL62LsH2sdPoixzqnrVFZh00mLZU5Vk+9fJU58hBPoL3WXE?=
 =?us-ascii?Q?i52yiou26Sk29YdqQRrFZEdxDCPB0gjq20zmjVNYdDu3puYdlBrA4zBYjiWS?=
 =?us-ascii?Q?9yj/mE5zUYwhyMm8DJ5scefqkEqHcoywW0PvGTr+CX+GRfnO/7TihawkT05V?=
 =?us-ascii?Q?4AaFJuwj2CQ7qPUAMebhR1W4nPSyrjESAcx/8wgNe+7XG9zPADg4lLOBJ9IZ?=
 =?us-ascii?Q?m5j7zfrCNcd9V09k7qvgt9iC+uewLiXAK3GJ5Au9neyfhC9NNHnEj0arEKPZ?=
 =?us-ascii?Q?+20ZUATg0yCqdBnpJbjB49RO/EyVJWyLsuuKIt1YhXS6AaDYWJuDaQtqJkWw?=
 =?us-ascii?Q?V+LqZ/X9MVu3P8ElxvxkkIkiuHA3hfNFvrA5u9j2SAJVZFpTP70z5tyvU0SB?=
 =?us-ascii?Q?wY8J2tXovgh27EcGnnLCsJSyZNpchzX3UrQ78Qn75NgWu/jpcv4+86czkYIQ?=
 =?us-ascii?Q?s46ESrVsxVP587hVL2LVT4he0jFYZASq3qIo4nN5WukGUNsn4lNyAEKuJMkq?=
 =?us-ascii?Q?b5jf3PMxUK3JMudIhT9LnYAOsrRR5JKxr6dh0HCM0bTWlBK4Zw0jpcIlRzxx?=
 =?us-ascii?Q?shcF0a8ieJ7bJ/qDrHxfXls+H8rjtXu2370gmyKxVc2abZiJN6TzRKGNYHq/?=
 =?us-ascii?Q?6SlA48nMkTv2JwV8G8weXxe1/ItorcnCCpQ08zg2mE8bUvr6xSBR96QWfTN2?=
 =?us-ascii?Q?/0KCRdELu983WoxdBeWAWfiho2sW5xLLm9KmR7wW39aPoT871wNmO7MJE1sn?=
 =?us-ascii?Q?lDYso7yU3AHIBLkx5zkA1QggEYcfXYT1hEMrUK57uzuKuJEvjLJAAGwwigoT?=
 =?us-ascii?Q?xkt3Jpwer/HF3xmezzElw4QCnhA3xWz7H0Ep7EH9Sh71tKZIlwt8hX3aAbyr?=
 =?us-ascii?Q?Xn1SZbB3lgzFKV93bquFx4awlpLaQzLT13xlXhNG7D4C5kRbYF6dpWAD/rjx?=
 =?us-ascii?Q?4m9Dgls8ZFtZs8kZO6TLyJjF+xVYYf8hAjTSaWEtWne6XtFbxsks2KcXIn+T?=
 =?us-ascii?Q?6tHz9BK7BfmEv5vKs35RwWhEx93Z45hHNMP9uN7dnVacmJwxLDK+DYREqdBW?=
 =?us-ascii?Q?J2L6M3niOi6wKSma6c3EPO9Eb78FVs2285BEJ0XeftPqZtunG2GCVGizZwJz?=
 =?us-ascii?Q?zcZkj/tC3xLQeRyXUGJmFIqy1MjlIRU9z5hfVQqagICAmt4nufzPGoJi43dg?=
 =?us-ascii?Q?QRyXeylMWxKajZTo7KQ/OCrzsjBv9DqzkdX0dYcqr2w7f4EBqPPy2+ocwUPL?=
 =?us-ascii?Q?IkXXvKGXGU0wrUmID4Ugn0ohPz0pnMmMEhhgtXsh5c42kYHXTel0xZxRUf62?=
 =?us-ascii?Q?nEXXdp3VlGNlMNrBMSudCQ+rY4J9YwER6RKFTHV9LVzYvEyWyNPI3okBC+TY?=
 =?us-ascii?Q?rcXP8Brbp1jDlylKAXJoC5x4nUAc/+LhhqoXMvjN35S3jtAjH2+UhVnNFSpe?=
 =?us-ascii?Q?bpB4QzGLlqHbRBfUOzwlIKZYCmjMgEVZzRLfjIdWNAKlteeOoCAuDQ2Wttap?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HffjrSYBGDLuhEmSZC4LiyeHz7AtXvQk9oNfuS9AAsvLWcjT3p8PXj29HzcKvb5LW1K8GKKzCBsPZ8Qsff8Qx9y663Omi373jU+RQ8YQPbjeuB3/v6hdfXqFHr7Plo/7N3zXeyY6P7fKwqUWgv0+CMZAlq4hInyPxA1yIdwAPVWots7+BfcOQm744ogu64tw47SvV+t1so1VL9RDw/jxfeF14lCQLwwwX3mCNW8Gir3eb+DWtWJQNHcrT3qBdmCO8zi3f57ilGnFOSx0DuXjE4jMg7FZvjmL6lQzz7JADuxiMPTr5RLQuA5SP3pZwYiBkfj/DwaPnz/X/mJ06Ev9y/SP713bD+JXz1UTi9VkACvZo1rj9OaL7x2oF9UKAz1CJ8wBII/9/twd1WmrGXneOxRh5WA9W1Or/0ipiTKqAVU+aGuZsCO3ZLNOfbPURt/FGzGCIa0K4pTCmd0lLlKuYV0sWRwGtou6cNhs6hrRaLpFzq7qk+HpxzEcBDUEBezUaaa9LYEG5GU5TMdRH9K/P7VKiVbm6RthpbfVEDEMXigVgzvYsLq7oS6zp4h9QHy992ZgD+HPBeauOZ+RyoND+Zu1IumLeyC/QdvqIgNu1yM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2c44bf-0fc7-4a1c-3714-08dcb19781f6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:32:25.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /giLOMgYHraHcnAAHDKS6PhGOWC7Gf4qvJUFBwH3Wd8RSXQyMRcjvHSUOF+3poA84mZthdzYaQJduqQfpafViw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7090
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310137
X-Proofpoint-GUID: 14I-2GEMi3VoCgheqXIKY9No2BPVLCOo
X-Proofpoint-ORIG-GUID: 14I-2GEMi3VoCgheqXIKY9No2BPVLCOo

On 31 Jul 2024, Kris Van Hees spake thusly:

> The subject line does not (to me) convey what this patch actually does.  It
> would be more clear to perhaps say something like "test: remove obsolete
> kernel coverage data collection'

Sorry, that's a truly *terrible* subject line isn't it :( A classic
case of being deep in the runtest weeds and forgetting that the tests
include, uh, actual *tests* and not just the test runner.

Adjusted to exactly what you suggested, except s/test/runtest/ (since
it's not a *test* at fault here).
