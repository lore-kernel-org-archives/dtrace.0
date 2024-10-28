Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7618BBB9
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135899; cv=fail; b=WBs9wRWvXM43nSmCSno+yG5gs/kwPTxaGWXHKwXcIbTv6VRrmq3GGgAL3D9/PsHuDAZvoaUE/rlooue9g+WvahKSG03513c17geQ3d1bH6azGpzH/a5+yw/VHkoIneDLP499CDfyASRDoof0CXxAlGE/5wmFsQuNxmJoquXLSjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135899; c=relaxed/simple;
	bh=inNYPQzaNK21X3DjtryCLew1uqrD70vvOlXcw5C/nuk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=pctPCZRuFJckHhUMZHRM0DBURER3E/Jkva9TJD7M5cHpydwvv+PeTbY+TJNHDSI2o/0hzcZjLAmHSRMVYlVmzeqMIAMmjrsYU79SR4+h2QBoww62Wm+ge+5TwRjgPNxtrlbOwykeOWsRYK5bt5/6k3490QL0Kgyb9vaOSDXFd48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=alPMpKOM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YAOiOmu/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="alPMpKOM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YAOiOmu/"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEuPcx023227;
	Mon, 28 Oct 2024 17:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=muWc3NQht6rn83ZwwB
	GxMiHdGOPKXzN+83sIm6vc7fM=; b=alPMpKOMQAYm6qx3kkRbowBDClW4Ny4+P3
	qqHXRKTXAXqQHHSlSlIz80F3aVlIKsmW5WB7pL+Hvn4VzxP6ZnV7ws9/3XI9JYGV
	mrrWH7uFeXaGUYoA3UmC9iE4yVuovLJBqgEz6W0ItVtgnVMF26nY37Nxu/hNv3xE
	NZesJRQopqh86ymSFH8dL4WPE0zgYR/nR/2ifF4VAJ7mVizLpyDBxHtOGFUxHmhg
	CEzFZu+55h5HfwJAOjdYUOiCtRqpSJOLWD9v/ktjj3iwO8ryyA3xwLbbViNcreRD
	g1lOuNZD+iXFTLDu/IElMUKVC9GehVA+H4NbHhfpP/RAKa9zR7JA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3ef6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 17:18:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SGQJAI008675;
	Mon, 28 Oct 2024 17:18:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hne87yrg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 17:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymkMAibsfv7MdaJ+xdlCGoLqm1i8W77rlcLW/cKM90eXcHyDsQpnPna896Q3mgmE5rww6exI7AMUDZvtL9wKp9RwwclImNmse6TiTPCFJKRfhA8MBlvTE2oZoL9xQBMWhQwgcROygkz51vG6B/hjTU5zeV8Lc2YeDBF1EVmwwkvkCLj8gtEJwHHM5JsqO1MLawPdOdFoCa6nJHLd6ISZmulPJHcQ8tyBty2yx9Vl0iIKQ1pPCAqnIpfIb7ESprkxOY2PdRPfycLg9juhHvBo0EoRoHvfJwHjq9S/2Si7hbjFe4ISSjH51iDg/4AunTQxv3fbrIdzYJBwynkUlaR2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muWc3NQht6rn83ZwwBGxMiHdGOPKXzN+83sIm6vc7fM=;
 b=tjDkAk4ROc5Jou/kPuqqclhXPcUFbEt3myZjlHSGEtjfmJQNpLK7evPy3Lm8brLur6sohbx2EWa38d6sXtKeI7XJoF5/0gUxkF36W+NzYjPlwtzi/gSz2BgP4UdAGxV1YgRS0ulH0ns9/rfn2b/Wpa56xJCFHAxtCnGx86j86IhVRzVf9Fp8eRObcKGQMP7ojsiOtdTfaEAtpPU49W+AA4wHiyfYmjY+3jrqp0wCzFWt6k2GLEC+UHipy+gPcgHlBDhFfeN8uCVD8n0myHEPp2GznV9gLzx3ccGywKg2T2uetN8qEatifD8Uo/yqWxrqNjNjG7xDvhkPk2+wqWSHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muWc3NQht6rn83ZwwBGxMiHdGOPKXzN+83sIm6vc7fM=;
 b=YAOiOmu/sfPqnwVK4pCnwXJR8zEsG27BKbTL9bYE/MEg0eB2jYtIAEiLdn4yVxdnNDAAQVoQqRZ9woEHE99pJeknYFkhtsJAgukZL8hqK+VdF3f+F5k6I8musP4VWbt1i30ZCDUOqwvZ1CSIcycx3TdJ1YgQO/D2xhwm7UDfOVs=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by IA1PR10MB6169.namprd10.prod.outlook.com (2603:10b6:208:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 17:18:04 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 17:18:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 12/14] man: add manpage for dtprobed(8)
References: <20241024113758.182050-1-nick.alcock@oracle.com>
	<20241024113758.182050-13-nick.alcock@oracle.com>
	<ZxsIRvjUwcpc-dkK@kvh-deb-bpf.us.oracle.com>
Emacs: (setq software-quality (/ 1 number-of-authors))
Date: Mon, 28 Oct 2024 17:18:02 +0000
In-Reply-To: <ZxsIRvjUwcpc-dkK@kvh-deb-bpf.us.oracle.com> (Kris Van Hees's
	message of "Thu, 24 Oct 2024 22:53:58 -0400")
Message-ID: <87ldy8qh85.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|IA1PR10MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 5876e5f8-70b2-4fbe-1907-08dcf7747bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nl6cjKhfqmRNkNeW8UzEf56gcK9AGVTcqTBQYAmu+TqcdNnbEgbMEu/8hcop?=
 =?us-ascii?Q?FsfwNz3kbrizp3hhCjH1SOWhSJlBLPvuXZ7V3sqwADM1iar1plxmcStvBwLE?=
 =?us-ascii?Q?YcVF4Mn7GsTfJagg0hroRy1D0aMpr1iexrFCQzcwKh9edyhLS2+HxQDcXOnc?=
 =?us-ascii?Q?iLHQkUdxlcPiykUEro9djH3Wkdit7El2O55ov/FRqDDsOz1EaJwRHVhd8QrR?=
 =?us-ascii?Q?QHpsiTwQqZ3vDPgDP4oRw6S4VnD/hIT91hkiPHYqPsz48DqMt8Bd7rLMoUGT?=
 =?us-ascii?Q?cJRhf9au72UJYffhq3Oi4N0oEg+nr5rBgtXSycXeTuPRYFGH7bjv6nuWHNDJ?=
 =?us-ascii?Q?RfiVRFRshIsVM5EgIIGwfp5ACAQyf/c197Go2gED7BP043E5CENHWgbJKtwZ?=
 =?us-ascii?Q?X0OhCzTTmvJiK97Owe3y98qx3uZd2+dI85vN52Z+yAJa/4y21OfmGmCmJXBA?=
 =?us-ascii?Q?TqzKwzDcS1jAskbZ8/q1lrqr++NgoSWdcBOQP86TO2nJsncIwAfqZW/zfPVP?=
 =?us-ascii?Q?MIM6DrFCQh6/jwjWxghqNJImpu89xACdJTP0q/Ui3sO4UNIX4oGhmwhK3nPG?=
 =?us-ascii?Q?yJn9NLRVjNXQD0ZSPIiptX9ZaPGQw3SGMMJkYB5EGarBThAbxyqAmDZku08d?=
 =?us-ascii?Q?Kpa7yQbQLZGk6QXdPHO0yqKJ1Co2etWpUpsc8yyYOF3mQGsb4l4cylcvWI4s?=
 =?us-ascii?Q?udcmPWHVeWcJe6sPEi+cJ2aqaXvjJcgGVPBog/Taa1Ge65RdeGVKQBRKuDAp?=
 =?us-ascii?Q?9TOAWks9Y7l/pq1WVNUuoeQkbB6lTmUrjguHa056mUGlkC7NRCFWB5+j7YuS?=
 =?us-ascii?Q?5R9dN86s90ypqWqqm8NvbHRq9XtveTFK8teBizK0pyhBPIGWYIbFAkXpx82u?=
 =?us-ascii?Q?3LX+/VS44Z30wKh/Y6GwR/H57AejL+VVZwkhNhBnLip0y4vgQaE2DgS33b2q?=
 =?us-ascii?Q?+/TAWYq9Jmjg8JtGNTmGMVfumoezzPLhVgbS/7ULRIaEMStvilpB3wpOe2HL?=
 =?us-ascii?Q?MBfyJ2Qot53TrKz18V5Hi1iDevOzbS1JvbjR+EfRx24jdJmE5G/hvDozUM2y?=
 =?us-ascii?Q?GY5XVirEchOlVVpxMom0tXoww8npxZhbCra/fQjZXgHi5bsNvi6bn+gGXoHw?=
 =?us-ascii?Q?c8bG9CFkZXkXPDvC12KqFUa58AGhWWavnm2FJ/zuqZBCNcBTxRAjct37ZNrK?=
 =?us-ascii?Q?wWgz9rtGpJF4QBEBEc8TJIJzKCCYvfYzLGakgukmayiXYy/wzPV3Ud0VD6rt?=
 =?us-ascii?Q?DAIj9rfWi70A0/xeR6/ukzxFoUuMHGcQlsTyIud98EbNeEiWCD85nMMNyXgm?=
 =?us-ascii?Q?ND+JtKssF2HrlSpzvO/6JdHe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u+vNFzE6/WJjOZa3WimG5+IfUsxX565Pycc8AxX38A1qR4g/3SSMWBb/P0UE?=
 =?us-ascii?Q?nNIVA0OCcHoB6pm79ZXBE56lA+If/+44jZNnqjreLw8LLwQt69ZceXXNoJAG?=
 =?us-ascii?Q?MiZFYSlxKP/3gU2Qy0vsTcdCzcNtBG1KTllfCsNQX4swJPRACLcszKiqPQG6?=
 =?us-ascii?Q?wYOi2g627aBRh0BkmFI1qamGuR6hakMlCVLnwMlG/z6unZtpj9L1/gaZo5M5?=
 =?us-ascii?Q?2Wd8lgs32bhVWS095FM+ntrgpB8+sUCVEVgqG8gdCnfln6jjHtzFBJ7Kki5u?=
 =?us-ascii?Q?M5MY2crjmsCahMppI2Hqf9brKFRl36X/MbDPOMQ+ZT5pPwdU+k5gf5Ik6OyH?=
 =?us-ascii?Q?fNExEvRD0VXIsciJVhHqfWwvzZcvApS4FnsJ/Ual5jIUnXduMNCfexEjxc4U?=
 =?us-ascii?Q?HIIDLPH/NSTJ7BpmlMRTzi+EGb6oKcsNE00pcQyIeZBwv0+x57b6Y5TnEBg2?=
 =?us-ascii?Q?LNFJIIeQxU0/5kS8/hc1tdUJtKoK5PzqoDU8IWNH/xO7ZeBhUmgD4VllGdJA?=
 =?us-ascii?Q?cTvU5iPUqo7gAV7+D3Ii/URFIBlXiq6BL10VzeGIe6K0GWnTQnYnY6y+ihKL?=
 =?us-ascii?Q?pU6E+Ma4sc+s/VqysyEPp8riFVFLMF9KpudCvmKBP0VrcS5DSlJjBwxaF3Cq?=
 =?us-ascii?Q?IC3feR9kGFE0k4Rk9E5O4KXPGs3AXg62bjDOASAj8sz1P9yXG8G3R2c+1ITv?=
 =?us-ascii?Q?Jcnnb/9gmzscgv8GqR9fJV+pdyS+ugkb08kpqvzP9r8xdX6uESq4Ql9Uid3+?=
 =?us-ascii?Q?zKlLz6awF+tGnh8gyfte8vVxeF4h4wtQRGFAEmQy1hF+q3poNzFYFDQrzr2D?=
 =?us-ascii?Q?3xN16q9o50uHCAopRA81/a4GgZAES4porB595G3SHbYFXe2Y9HQvG+AfYFti?=
 =?us-ascii?Q?WGyhaMNwSZQz7eNHbQB66EKST6C+YGYHw8WkV1QYPU+XIzRJqfggHOeCACwK?=
 =?us-ascii?Q?P17qFJIr3+n/HCDkfH1E4fzjrsCE0Mo9w7xHJ6omIMpHl3f/uF78vBGEuaLW?=
 =?us-ascii?Q?njhZR8ByghwJS92ETitWggoAH2DbZEmiRhXDuueRdN8Rvhz6nH8YlBXjksPI?=
 =?us-ascii?Q?EovCeynJ1MROnXl5OOxAY/72ky9GZRiPG8J0YK+9RTdK5SFl4E65kS9UYy0i?=
 =?us-ascii?Q?WHTaRZ1dl8oArMXnJSCDsNJ2cW87o9kSe7whb9ArQQSAELE6rIh5jUvAyf7q?=
 =?us-ascii?Q?kyVWaif9/jvNPLFC5eBJlyOQ7a8grVTOke9Eqv/wU1+kzoiKibb818kciO5R?=
 =?us-ascii?Q?Vy1THEg9AaXe0rI/DHyiphgNW5cApT12BH3AwFUK0tSMuS/XzBGk8SmoiVNF?=
 =?us-ascii?Q?ksADRQlwFayJRU6Tk4c4Wdo5hTTGvXsqlmhV8tSDa2lDtjpXPbQdGjj3ViOH?=
 =?us-ascii?Q?8wXpHFJQefVf9+4Q2e0VECrdu5MzwSKY0/2wi5vRwYmndhmP0lrJw/QsbW+e?=
 =?us-ascii?Q?G3u8x0Ku0F7zSOHlh4vniVQ8x3Y9Q5etra6794OV2POlQXBm9NWLcqBpsEbq?=
 =?us-ascii?Q?c9ZqXGahu+VuCA5sChuwDCL4rC1yIuwlYjJ3GOk0ooBhP8O6zicWnjLvbo+l?=
 =?us-ascii?Q?+IXwKIDsLRJZnyoDdb9BDe8b5iloYI7NQDuqeFgheExHVkA43Bw4sBRi1V6+?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fSbbx2pkNJu2mCGWbYVO7SpPuj2qyfO2TGUOALrbXVX/BowY8Hxv1+1phxsYSGcNMWE5aLclSFSusQN0+OsdQBDTm2QDqebjyWMZBZXtZPeGvupqTxjvenJzAoZMV+abpfI3wA67t3142P8AR7xmiZeA3cc7AGSX4A2uy/73g9hCiobLUiOjciR4ocGSiQO44AJkDMdc6Jagc/bbzmPV2xOViql7V4wZA9SyNha0OnN2yNm7mF+0PDiqVEi7vywiekAX87DgWSo1m2n5ZrAS9vqbb3eupYzkrw6MOeqHFfjhQwfz0lz+8byZ1aixMlG1fXd610yclUzx48pOP3wtpalbblCJeVRXkmXe3TYuZy2m6mqWcLWpd3kYZzJDox4Gla2al2Y196COtYU7u+Y7pyFUsrxfTqUBshbi7fyzi5YwVE3ZHf1M+8N5lF/FrzvGGFunjSBN8+AKzdlmGtM/46a4LQZhOQR1sfgNM2Re5ttNxAN/vQHWA8rhctu0xY+uo9WrNUFIDPhmxRzJhcvMOuJy5712lKOaI+Mt0b+1+BpjhvAsZKa8kQ1GkX9kCSo7yZQ04vxv+DSFwxvvK0FgIK8hZntRbpN6sLcebnmLg9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5876e5f8-70b2-4fbe-1907-08dcf7747bd3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:18:04.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fkzq3u2TSy9QQeXkUGlgICeZjYvJkP8bWHIo+0ZE7eSlqsaHO8AzMGOuk3YRUBvNr42CRwKPiOTeMjC4Au4v9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6169
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_06,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280137
X-Proofpoint-ORIG-GUID: tx8LAXni7aoZnR81RGjgIRGbA2VOnviP
X-Proofpoint-GUID: tx8LAXni7aoZnR81RGjgIRGbA2VOnviP

On 25 Oct 2024, Kris Van Hees uttered the following:

> On Thu, Oct 24, 2024 at 12:37:56PM +0100, Nick Alcock wrote:
>> Cross-reference it from dtrace(8).
>> 
>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> Bug: https://github.com/oracle/dtrace-utils/issues/94
>
> Bug: before Signed-off-by:

Ack.

>> +.SH SEE ALSO
>> +.
>> +.BR cpp (1),
>> +.BR ssh (1),
>> +.BR dtprobed (1)
>
> I would think this would refer to dtrace (only).  There does not seem to be
> any point in referring to cpp, ssh, dtprobed.  Copied from dtrace.8 and forgot
> to edit out?

Absolutely! Fixed.

-- 
NULL && (void)
